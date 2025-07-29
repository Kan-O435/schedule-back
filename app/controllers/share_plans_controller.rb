class SharePlansController < ApplicationController
 # skip_before_action :authenticate_user!

  def create
    puts "=== SharePlans#create Debug ==="
    puts "Params: #{share_plan_params.inspect}"
    puts "Looking for user with UID: #{share_plan_params[:user_id]}"
    
    user = User.find_by!(uid: share_plan_params[:user_id])
    puts "Found user: #{user.inspect}"
    puts "User ID: #{user&.id}"
    puts "============================="
    
    share_plan = SharePlan.new(
      user_id: user.id,
      plan_id: share_plan_params[:plan_id]
    )
    
    begin
      if share_plan.save
        render json: { message: "予定を共有しました" }, status: :created
      else
        render json: { errors: share_plan.errors.full_messages }, status: :unprocessable_entity
      end
    rescue ActiveRecord::RecordNotUnique
      render json: { message: "このユーザーは既に招待済みです" }, status: :conflict
    end
  end

  def destroy
    share_plan = SharePlan.find_by(user_id: params[:user_id], plan_id: params[:plan_id])
    if share_plan&.destroy
      redirect_to user_plans_path(share_plan.plan.user), notice: "共有を解除しました"
    else
      redirect_to user_plans_path(share_plan.plan.user), alert: "共有解除に失敗しました"
    end
  end

  def shared
  user = User.find(params[:user_id])
  shared_plan_ids = SharePlan.where(user_id: user.id).pluck(:plan_id)
  shared_plans = Plan.includes(:user).where(id: shared_plan_ids)

  render json: shared_plans.as_json(
    include: { user: { only: [:id, :name, :email] } },
    only: [:id, :title, :description, :start_time, :end_time]
  )
end


  private

  def share_plan_params
    params.require(:share_plan).permit(:user_id, :plan_id)
  end
end
