class User < ApplicationRecord
  has_many :plans, dependent: :destroy
  has_many :share_plans, dependent: :destroy
  has_many :shared_events, through: :share_plans, source: :plan

  has_many :shared_users, through: :share_plans, source: :user

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
end
