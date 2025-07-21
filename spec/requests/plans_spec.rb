# spec/requests/plans_spec.rb
require 'rails_helper'

RSpec.describe "Plans API", type: :request do
  let(:user) { User.create!(uid: "firebase-uid-123", email: "test@example.com", name: "Test User") }

  before do
    # FirebaseAuth.verifyのモックで認証を通す
    allow(FirebaseAuth).to receive(:verify).and_return(user)
  end

  describe "POST /users/:user_id/plans" do
    it "認証済みユーザーが予定を作成できる" do
      headers = {
        "Authorization" => "Bearer dummy-token",
        "Content-Type" => "application/json"
      }

      params = {
        plan: {
          title: "テスト予定",
          content: "テスト内容です",
          start_time: Time.current.iso8601,
          end_time: (Time.current + 1.hour).iso8601
        }
      }.to_json

      post "/users/#{user.id}/plans", params: params, headers: headers

      expect(response).to have_http_status(:created)

      created_plan = Plan.last
      expect(created_plan.title).to eq("テスト予定")
      expect(created_plan.content).to eq("テスト内容です")
      expect(created_plan.user_id).to eq(user.id)
    end
  end
end
