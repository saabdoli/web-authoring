require "rails_helper"

RSpec.describe User, :type => :model do
  it 'has a valid factory' do
    factory = FactoryGirl.create(:user)
    expect(factory).to be_valid
  end

  it 'is valid with valid attributes' do
    user = FactoryGirl.build(:user)
    expect(user).to be_valid
  end

  it 'is not valid without a email' do
    user = FactoryGirl.build(:user, email: nil)
    expect(user).to_not be_valid
  end

  it 'is not valid without a password' do
    user = FactoryGirl.build(:user, password: nil)
    expect(user).to_not be_valid
  end
end
