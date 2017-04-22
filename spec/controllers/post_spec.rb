require "rails_helper"

RSpec.describe PostsController do
  describe 'GET index' do
    it 'populates a list of posts' do
      post = FactoryGirl.create(:post)
      get :index
      expect(assigns(:posts)).to eq([post])
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template('index')
    end
  end

  describe 'GET new' do
    it 'assigns @post with new' do
      sign_in FactoryGirl.create(:user)
      get :new
      expect(assigns(:post)).to be_a_new(Post)
    end

    it 'renders new template' do
      sign_in FactoryGirl.create(:user)
      get :new
      expect(response).to render_template('new')
    end
  end

  describe 'GET edit' do
    it 'assigns @post' do
      sign_in FactoryGirl.create(:user)
      post = FactoryGirl.create(:post)
      get :show, params: { id: post }
      expect(assigns(:post)).to eq(post)
    end
    it 'renders edit template' do
      sign_in FactoryGirl.create(:user)
      get :edit, params: { id: FactoryGirl.create(:post) }
      expect(response).to render_template('edit')
    end
  end

  describe 'GET show' do
    it 'assigns @post' do
      post = FactoryGirl.create(:post)
      get :show, params: { id: post }
      expect(assigns(:post)).to eq(post)
    end
    it 'renders the show template' do
      get :show, params: { id: FactoryGirl.create(:post) }
      expect(response).to render_template('show')
    end
  end

  describe 'POST create' do
    it 'creates a new post' do
      sign_in FactoryGirl.create(:user)
      expect {
        post :create, params: { post: FactoryGirl.attributes_for(:post) }
      }.to change(Post, :count).by(1)
    end

    it 'redirects to new post' do
      sign_in FactoryGirl.create(:user)
      post :create, params: { post: FactoryGirl.attributes_for(:post) }
      expect(response).to redirect_to Post.last
    end
  end

  describe 'PUT update' do
    before :each do
      @post = FactoryGirl.create(:post, title: 'Title', text: 'text')
      sign_in FactoryGirl.create(:user)
    end
    it 'located the requested post' do
      put :update, params: { id: @post, post: FactoryGirl.attributes_for(:post) }
      expect(assigns(:post)).to eq(@post)
    end

    it 'changes @posts attributes' do
      put :update, params: { id: @post,
        post: FactoryGirl.attributes_for(:post, title: 'New Title', text: 'text') }
      @post.reload
      expect(@post.title).to eq('New Title')
      expect(@post.text).to eq('text')
    end

    it 'redirects to updated post' do
      put :update, params: { id: @post,
        post: FactoryGirl.attributes_for(:post) }
      expect(response).to redirect_to @post
    end
  end

  describe 'DELETE destroy' do
    before :each do
      @post = FactoryGirl.create(:post)
      sign_in FactoryGirl.create(:user)
    end

    it 'deletes the post' do
      expect {
        delete :destroy, params: { id: @post }
      }.to change(Post, :count).by(-1)
    end
    it 'redirects to post index' do
      delete :destroy, params: { id: @post }
      expect(response).to redirect_to posts_url
    end
  end
end
