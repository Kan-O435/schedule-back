class SharePlansController < ApplicationController
 # skip_before_action :authenticate_user!

  def create
    share_plan = SharePlan.new(share_plan_params)
    if share_plan.save
      redirect_to user_plans_path(share_plan.plan.user), notice: "予定を共有しました"
    else
      redirect_to user_plans_path(share_plan.plan.user), alert: share_plan.errors.full_messages.join(", ")
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
