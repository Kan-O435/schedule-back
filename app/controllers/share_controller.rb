class SharePlansController < ApplicationController
  def create
    @share_plan = SharePlan.new(share_plan_params)
    if @share_plan.save
      redirect_to plans_path, notice: "予定を共有しました"
    else
      redirect_to plans_path, alert: "共有に失敗しました"
    end
  end

  def destroy
    @share_plan = SharePlan.find_by(user_id: params[:user_id], plan_id: params[:plan_id])
    if @share_plan&.destroy
      redirect_to plans_path, notice: "共有を解除しました"
    else
      redirect_to plans_path, alert: "解除に失敗しました"
    end
  end

  private

  def share_plan_params
    params.require(:share_plan).permit(:user_id, :plan_id)
  end
end
