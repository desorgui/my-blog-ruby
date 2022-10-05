class PostsController < ApplicationController
  def index
    param_id = params['id'].to_i
    @single_user = User.find_by(id: param_id)
    @user_posts = Post.where(author_id: param_id)
    @all_comments = Comment.all
  end

  def show
    puts params
    param_id = params['id'].to_i
    param_user_id = params['user_id'].to_i
    @user_found = User.find_by(id: param_user_id)
    @post = Post.find_by(id: param_id)
    @all_comments = Comment.where(post_id: param_id)
  end

  def new
    Post.new
  end

  def create
    @post = ::ApplicationController.current_user.posts.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to '/' }
      else
        format.html { render :new }
      end
    end
  end

  private

  def post_params
    params.permit(:title, :text, :author_id)
  end
end
