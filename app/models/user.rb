class User < ApplicationRecord
  has_many :plans, dependent: :destroy
  has_many :shared_plans, dependent: :destroy
  has_many :shared_events, through: :shared_plans, source: :plan

  has_many :shared_users, through: :shared_plans, source: :user

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
end
