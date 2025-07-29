class SharedPlansController < ApplicationController
 # skip_before_action :authenticate_user!

  def index
    user = User.find_by!(uid: params[:user_id])
    puts "=== SharedPlans#index Debug ==="
    puts "User: #{user.inspect}"
    puts "User ID: #{user.id}"
    puts "SharePlans count: #{user.share_plans.count}"
    puts "SharePlans: #{user.share_plans.inspect}"
    
    plans = user.shared_events.includes(:user).order(start_time: :asc)
    puts "Shared events count: #{plans.count}"
    puts "Shared events: #{plans.inspect}"
    puts "============================="

    render json: {
      plans: plans.map do |plan|
        {
          id: plan.id,
          title: plan.title,
          content: plan.content,
          start_time: plan.start_time,
          end_time: plan.end_time,
          owner_id: plan.user_id,
          owner_name: plan.user.name
        }
      end
    }
  end

    def create
    puts "=== SharePlans#create Debug ==="
    puts "Params: #{shared_plan_params.inspect}"
    puts "Looking for user with UID: #{shared_plan_params[:user_id]}"
    
    user = User.find_by!(uid: shared_plan_params[:user_id])
    puts "Found user: #{user.inspect}"
    puts "User ID: #{user&.id}"
    puts "============================="
    
    shared_plan = SharedPlan.new(
      user_id: user.id,
      plan_id: shared_plan_params[:plan_id]
    )
    if shared_plan.save
        render json: shared_plan, status: :created
    else
        render json: { errors: shared_plan.errors.full_messages }, status: :unprocessable_entity
    end
    end

  def destroy
    user = User.find_by!(uid: params[:user_id])
    shared_plan = SharedPlan.find_by(user_id: user.id, plan_id: params[:plan_id])

    if shared_plan&.destroy
      head :no_content
    else
      render json: { errors: "削除に失敗しました" }, status: :unprocessable_entity
    end
  end

  private

  def shared_plan_params
    params.require(:shared_plan).permit(:user_id, :plan_id)
  end
end
