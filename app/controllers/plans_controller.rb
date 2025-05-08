class PlansController < ApplicationController
  before_action :set_user
  before_action :set_plan, only: [:show, :update, :destroy]

  def index
    plans = @user.plans.order(start_time: :asc) #予定の開始時間を昇順に並べて管理
    render json: plans
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
    if @plan.update(plan_params) # 修正: plan_paramsに変更
      render json: @plan, status: :ok
    else
      render json: { errors: @plan.errors.full_messages }, status: :unprocessable_entity # 修正: @plamを@planに変更
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

  # userを取得、ここから忘れがち
  def set_user
    @user = User.find(params[:user_id])
  end

  def set_plan
    @plan = @user.plans.find(params[:id]) # 修正: plams -> plans
  end

  # リクエストから送られてきたデータを許可するためのメソッド
  def plan_params
    params.require(:plan).permit(:title, :content, :start_time, :end_time)
  end
end
