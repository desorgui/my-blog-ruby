require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /posts' do
    before do
      user = User.create(name: 'Kenobi', posts_counter: 0)
      post = Post.create(title: 'The Revenge of the Sith', comments_counter: 0, likes_counter: 0, author: user)
      get user_posts_path(post.author_id)
    end

    it 'returns a 200 status code' do
      expect(response).to have_http_status(:ok)
    end

    it 'renders the posts template' do
      expect(response).to render_template('posts/index')
      expect(response).to render_template('layouts/application')
    end

    it 'includes correct placeholder text for /posts' do
      expect(response.body).to include 'List of all posts for a given user'
    end
  end

  describe 'GET /posts/id' do
    before do
      user = User.create(name: 'Kenobi', posts_counter: 0)
      post = Post.create(title: 'The Revenge of the Sith', comments_counter: 0, likes_counter: 0, author: user)
      get user_post_path(post.author_id, post.id)
    end

    it 'returns a 200 status code' do
      expect(response).to have_http_status(:ok)
    end

    it 'renders the /posts/id template' do
      expect(response).to render_template('posts/show')
      expect(response).to render_template('layouts/application')
    end

    it 'includes correct placeholder text for /posts/id' do
      expect(response.body).to include 'specific post for a given user'
    end
  end
end
