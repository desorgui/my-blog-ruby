<<<<<<< HEAD
class Api::V1::CommentsController < ApplicationController
  skip_before_action :verify_authenticity_token
=======
class Api::V1::CommentsController < ApplicationController 
  before_action :set_post, only: %i[index new]
>>>>>>> 0514e99e17fcbba6bba8e9c9de3667b6ce800ec5

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
<<<<<<< HEAD
    Comment.create(author_id: current_user.id, post_id: params['post_id'], text: params['text'])
    redirect_to "/api/v1/users/#{current_user.id}/posts/#{params[:post_id]}/comments"
=======
    @comment = Comment.create(author_id: current_user.id, post_id: params[:post_id], text: params[:text])
    render json: @comment
>>>>>>> 0514e99e17fcbba6bba8e9c9de3667b6ce800ec5
  end

end