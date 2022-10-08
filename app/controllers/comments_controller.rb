class CommentsController < ApplicationController
  # before_action :set_post, only: [:index, :create]
  
  def index
    @commented_post_id = params['id']
    # @user = User.find(id: current_user.id)
    @comments = Comment.where(post_id: params[:id]).order('created_at DESC')
  end

  def create
    Comment.create(author_id: current_user.id, post_id: params['post_id'], text: params['text'])
    redirect_to "/users/#{current_user.id}/posts"
  end

  def remove
    puts params
    Comment.destroy_by(id: params['comment_id'])
    post = Post.find_by(id: params['post_id'])
    post.update(comments_counter: (post.comments_counter - 1))

    redirect_to "/users/#{current_user.id}/posts/#{post.id}"
  end

  def comment_params
    params.permit(:author, :post, :text)
  end

  
  # def set_post
  #   @post = Post.find(params[:id])
  # end
end
