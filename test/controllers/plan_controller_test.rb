require "test_helper"

class PlanControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  def index
    plans = @user.plans.order(start_time: :asc)
    render json: plans
  end

  def create
    plan = @user.plans.build(plan_params)

    if plan.save
      render json: plam, status: :created
    else
      render json:{ errors: plan.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def show
    render json: @plan
  end

  def update
    if @plan.update(plam_params)
      render json: @plan, status: :ok
    else
      render json: { errors: @plam.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    if @plan.destroy
      head :no_content
    else
      render json: {errors: "予定削除に失敗しました" }, status: :unprocessable_entity
    end
  end

end
