class User < ApplicationRecord
  has_many :plans
  has_many :share_plans
  has_many :shared_plans, through: :share_plans, source: :plan

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
end
