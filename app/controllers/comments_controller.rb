class CommentsController < ApplicationController
  def create
    @first_user = current_user
    @post = Post.find(params[author_id])
    @comment = Comment.new(comment_params)
    @comment.author = @first_user
    @comment.post = @post

    if @comment.save
      flash[:success] = 'Comment saved successfully'
      redirect_to "/users/#{params[:author_id]}/posts"
    else
      flash.now[:error] = 'Error: Comment could not be saved'
    end
  end

  def comment_params
    params.permit(:author, :post, :text)
  end
end
