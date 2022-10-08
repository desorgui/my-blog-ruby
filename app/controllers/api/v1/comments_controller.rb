class Api::V1::CommentsController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index    
    respond_to do |format|
      format.json { render json: Post.find(params[:post_id]).comments }
      format.html { render json: Post.find(params[:post_id]).comments }
    end
  end

  def new
    @post_id = params[:post_id]
  end

  def create
    Comment.create(author_id: current_user.id, post_id: params['post_id'], text: params['text'])
    redirect_to "/api/v1/users/#{current_user.id}/posts/#{params[:post_id]}/comments"
  end
end