require 'rails_helper'

RSpec.describe "SharePlans", type: :request do
  let(:owner) { create(:user) }
  let(:shared_user) { create(:user) }
  let(:plan) { create(:plan, user: owner) }

  describe "POST /share_plans" do
    it "他のユーザーに予定を共有できること" do
      expect {
        post share_plans_path, params: {
          share_plan: {
            user_id: shared_user.id,
            plan_id: plan.id
          }
        }
      }.to change(SharePlan, :count).by(1)

      # リダイレクト先をownerの予定一覧に修正
      expect(response).to redirect_to(user_plans_path(owner))
    end
  end

  describe "DELETE /share_plans" do
    let!(:share_plan) { create(:share_plan, user: shared_user, plan: plan) }

    it "予定の共有を解除できること" do
      expect {
        delete destroy_share_plans_path, params: { user_id: shared_user.id, plan_id: plan.id }
      }.to change(SharePlan, :count).by(-1)

      # 同じくリダイレクト先修正
      expect(response).to redirect_to(user_plans_path(owner))
    end
  end
end
