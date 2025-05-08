class Plan < ApplicationRecord
    belongs_to :user

    validates :title, presence: true
    validates :start_time, presence: true
    validates :end_time, presence: true
    validate :start_must_be_before_end_time

    private
  
    def start_must_be_before_end_time
      if start_time.present? && end_time.present? && start_time >= end_time
        errors.add(:start_time, 'must be before end time')
      end
    end
end
