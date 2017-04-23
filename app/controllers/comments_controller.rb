class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save!
      redirect_to post_path(@post)
    else
      render 'Comment creation failed'
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    if @comment.destroy
      redirect_to post_path(@post)
    else
      render 'Comment deletion failed'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
