require 'rails_helper'

RSpec.describe Plan, type: :model do
  describe 'associations' do
    it 'belongs to a user' do
      assoc = described_class.reflect_on_association(:user)
      expect(assoc.macro).to eq :belongs_to
    end
  end

=======

  #titleがないとerror
  it 'is not valid without a title' do
    user = User.create(name: 'John Doe', mail: 'john.doe@example.com', password: 'password')
    plan = user.plans.build(content: 'Important meeting', start_time: '2025-05-05 11:00:00', end_time: '2025-05-05 12:00:00')
    expect(plan).to_not be_valid
  end

  #start_timeとend_timeがないとerror
  it 'is not valid without a start time' do
    user = User.create(name: 'John Doe', mail: 'john.doe@example.com', password: 'password')
    plan = user.plans.build(title: 'Meeting', content: 'Important meeting', end_time: '2025-05-05 12:00:00')
    expect(plan).to_not be_valid
  end

  #開始時間が終了時刻と同じかそれ以降だとerror
  it 'is not valid if start time is after or equal to end time' do
    user = User.create(name: 'John Doe', mail: 'john@example.com', password: 'password')
    plan = user.plans.build(
      title: 'Meeting',
      content: 'Late meeting',
      start_time: '2025-05-05 13:00:00',
      end_time: '2025-05-05 12:00:00'
    )
    expect(plan).to_not be_valid
  end
>>>>>>> acfad9cfc518fc21e273e8aaf9469b0b7d6cc2f0
end
