require "rails_helper"

RSpec.describe CommentsController do
  describe 'POST create' do
    before :each do
      sign_in(FactoryGirl.create(:user))
      @post = FactoryGirl.create(:post)
    end

    it 'creates the comment' do
      expect {
        post :create,
          params: { post_id: @post, comment: FactoryGirl.attributes_for(:comment) }
      }.to change(Comment, :count).by(1)
    end

    it 'redirects to the same post' do
      post :create,
        params: { post_id: @post, comment: FactoryGirl.attributes_for(:comment) }
      expect(response).to redirect_to(@post)
    end
  end

  describe 'DELETE destroy' do
    before :each do
      sign_in(FactoryGirl.create(:user))
      @post = FactoryGirl.create(:post)
      @comment = FactoryGirl.create(:comment, post_id: @post.id )
    end
    it 'deletes the requested comment' do
      expect {
        delete :destroy, params: { post_id: @post.id, id: @comment.id }
      }.to change(Comment, :count).by(-1)
    end
    it 'redirects to the same post' do
      delete :destroy, params: { post_id: @post.id, id: @comment.id }
      expect(response).to redirect_to(@post)
    end
  end
end
