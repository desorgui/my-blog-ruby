class Api::V1::CommentsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_post, only: %i[index new]

  def index    
    respond_to do |format|
      format.json { render json: @post.comments }
      format.html { render json: @post.comments }
    end
  end

  def new
    @user = current_user
  end

  def create
    @comment = Comment.create(text: params[:text], author_id: params[:user_id], post_id: params[:post_id])
    redirect_to "/api/v1/users/#{current_user.id}/posts/#{params[:post_id]}/comments"
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end
end