class SharedPlansController < ApplicationController
  before_action :authenticate_user!

  def index
    user = User.find(params[:user_id])
    plans = user.shared_events.includes(:user).order(start_time: :asc)

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
    shared_plan = SharedPlan.new(shared_plan_params)
    if shared_plan.save
        render json: shared_plan, status: :created
    else
        render json: { errors: shared_plan.errors.full_messages }, status: :unprocessable_entity
    end
    end

  def destroy
    shared_plan = SharedPlan.find_by(user_id: params[:user_id], plan_id: params[:plan_id])

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
