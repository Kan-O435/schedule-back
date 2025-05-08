require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'バリデーション' do
    it '有効な属性ならユーザーが作成できる' do
      user = User.new(
        name: 'Taro',
        mail: 'taro@example.com',
        password: 'password',
        password_confirmation: 'password'
      )
      expect(user).to be_valid
    end

    it '名前がないと無効になる' do
      user = User.new(name: nil, mail: 'test@example.com', password: 'password', password_confirmation: 'password')
      expect(user).to be_invalid
    end

    it 'メールがないと無効になる' do
      user = User.new(name: 'Taro', mail: nil, password: 'password', password_confirmation: 'password')
      expect(user).to be_invalid
    end

    it 'メールが重複していると無効になる' do
      User.create!(name: 'Taro', mail: 'duplicate@example.com', password: 'password', password_confirmation: 'password')
      user = User.new(name: 'Jiro', mail: 'duplicate@example.com', password: 'password', password_confirmation: 'password')
      expect(user).to be_invalid
    end

    it 'パスワードがないと無効になる' do
      user = User.new(name: 'Taro', mail: 'test@example.com', password: nil, password_confirmation: nil)
      expect(user).to be_invalid
    end
  end
end

