require "rails_helper"

RSpec.describe Comment, :type => :model do
  it 'has a valid factory' do
    factory = FactoryGirl.create(:comment)
    expect(factory).to be_valid
  end

  it 'is valid with valid attributes' do
    comment = FactoryGirl.build(:comment)
    expect(comment).to be_valid
  end

  it 'is not valid without a commenter' do
    comment = FactoryGirl.build(:comment, commenter: nil)
    expect(comment).to_not be_valid
  end

  it 'is not valid without a comment body' do
    comment = FactoryGirl.build(:comment, body: nil)
    expect(comment).to_not be_valid
  end

  it 'is not valid without parent article' do
    comment = FactoryGirl.build(:comment, article_id: nil)
    expect(comment).to_not be_valid
  end
end
