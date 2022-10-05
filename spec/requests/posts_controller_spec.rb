require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /posts' do
    before do
      user = User.create(name: 'Kenobi', post_counter: 0)
      post = Post.create(title: 'hello', text: 'writing testing in rails', author_id: user.id)
      get "/users/#{post.author_id}/posts"
    end

    it 'returns a 200 status code' do
      expect(response).to have_http_status(:ok)
    end

    it 'renders the posts template' do
      expect(response).to render_template('posts/index')
      expect(response).to render_template('layouts/application')
    end
  end

  describe 'GET /posts/id' do
    before do
      user = User.create(name: 'Kenobi', post_counter: 0)
      post = Post.create(title: 'hello', text: 'writing testing in rails', author_id: user.id)
      get "/users/#{post.author_id}/posts/#{post.id}"
    end

    it 'returns a 200 status code' do
      expect(response).to have_http_status(:ok)
    end

    it 'renders the /posts/id template' do
      expect(response).to render_template('posts/show')
      expect(response).to render_template('layouts/application')
    end

    it 'includes correct placeholder text for /posts/id' do
      expect(response.body).to include 'writing testing in rails'
    end
  end
end
