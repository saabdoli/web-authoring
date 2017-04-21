require "rails_helper"

RSpec.describe Article, :type => :model do
  it 'has a valid factory' do
    factory = FactoryGirl.create(:article)
    expect(factory).to be_valid
  end

  it 'is valid with valid attributes' do
    article = FactoryGirl.build(:article)
    expect(article).to be_valid
  end

  it 'is not valid without a title' do
    article = FactoryGirl.build(:article, title: nil)
    expect(article).to_not be_valid
  end

  it 'is not valid with a name shorter than 5 characters' do
    article = FactoryGirl.build(:article, title: 'abc')
    expect(article).to_not be_valid
  end
end
