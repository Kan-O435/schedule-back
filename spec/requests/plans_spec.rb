# spec/requests/plans_spec.rb
require 'rails_helper'

RSpec.describe "Plans API", type: :request do
  let(:user) { create(:user) }
  let(:plan) { create(:plan, user: user) }

  describe "GET /users/:user_id/plans/:id" do
    it "特定の予定を取得できる" do
      get "/users/#{user.id}/plans/#{plan.id}"

      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body)["title"]).to eq(plan.title)
    end
  end
end

