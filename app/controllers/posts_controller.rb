class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy]

  def index
    # param_id = params['id'].to_i
    # @single_user = User.find_by(id: param_id)
    # @user_posts = Post.where(author_id: param_id)
    # respond_to do |format|
    #   format.html { render :index }
    # end
    @all_posts = Post.includes(:author).order('created_at DESC')
    respond_to do |format|
      format.html { render :index }
    end
  end

  # def all_posts
  #   # @all_posts = Post.all
  #   # respond_to do |format|
  #   #   format.html { render :all_posts }
  #   # end
  # end

  def show
    puts params
    param_id = params['id'].to_i
    # param_user_id = params['user_id'].to_i
    # @user_found = User.find_by(id: param_user_id)
    @post = Post.includes(:author).find_by(id: param_id)
    # Post.find_by(id: param_id)
    @all_comments = Comment.where(post_id: param_id)
  end

  def new
    Post.new
  end

  def delete
    Comment.destroy_by(post_id: params['post_id'])
    Like.destroy_by(post_id: params['post_id'])
    Post.destroy_by(id: params['post_id'])
    user = User.find_by(id: params['author_id'])
    user.update(post_counter: (user.post_counter - 1))

    redirect_to '/'
  end

  def create
    @post = current_user.posts.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to '/' }
      else
        format.html { render :new }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.permit(:title, :text, :author_id)
  end
end
