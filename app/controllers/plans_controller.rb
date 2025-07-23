class PlansController < ApplicationController
  #skip_before_action :authenticate_user!
  before_action :set_user
  before_action :set_plan, only: [:show, :update, :destroy]

  def index
    plans = @user.plans.order(start_time: :asc)
    render json: { plans: plans }
  end

  def shared
    shared_plans = @user.plans.where(is_shared: true).order(start_time: :asc)
    render json: { plans: shared_plans }
  end

  def create
    plan = @user.plans.build(plan_params)

    if plan.save
      render json: plan, status: :created
    else
      render json: { errors: plan.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def show
    render json: @plan
  end

  def update
    if @plan.update(plan_params)
      render json: @plan, status: :ok
    else
      render json: { errors: @plan.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    if @plan.destroy
      head :no_content
    else
      render json: { errors: "予定削除に失敗しました" }, status: :unprocessable_entity
    end
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_plan
    @plan = @user.plans.find(params[:id])
  end

  def plan_params
    params.require(:plan).permit(:title, :content, :start_time, :end_time, :is_shared)
  end
end
