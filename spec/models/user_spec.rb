require 'rails_helper'

RSpec.describe User, type: :model do

  #name,mail,passwordがすべてそろっているときuserが有効になる確認
  it 'is valid with valid attributes' do
    user = User.new(name: 'John Doe', mail: 'john.doe@example.com', password: 'password')
    expect(user).to be_valid
  end

  #nameが抜けているとerrorなる
  it 'is not valid without a name' do
    user = User.new(mail: 'john.doe@example.com', password: 'password')
    expect(user).to_not be_valid
  end

  #mailが抜けていると同様にerror
  it 'is not valid without an email' do
    user = User.new(name: 'John Doe', password: 'password')
    expect(user).to_not be_valid
  end
end
