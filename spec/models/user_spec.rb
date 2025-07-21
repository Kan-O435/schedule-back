require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it 'has many plans' do
      assoc = described_class.reflect_on_association(:plans)
      expect(assoc.macro).to eq :has_many
    end
  end
end
