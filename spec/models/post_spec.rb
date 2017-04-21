require "rails_helper"

RSpec.describe Post, :type => :model do
  it 'has a valid factory' do
    factory = FactoryGirl.create(:post)
    expect(factory).to be_valid
  end

  it 'is valid with valid attributes' do
    post = FactoryGirl.build(:post)
    expect(post).to be_valid
  end

  it 'is not valid without a title' do
    post = FactoryGirl.build(:post, title: nil)
    expect(post).to_not be_valid
  end

  it 'is not valid with a name shorter than 5 characters' do
    post = FactoryGirl.build(:post, title: 'abc')
    expect(post).to_not be_valid
  end
end
