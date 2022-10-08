class Api::V1::CommentsController < ApplicationController 
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
    @comment = Comment.create(author_id: current_user.id, post_id: params[:post_id], text: params[:text])
    render json: @comment
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end
end