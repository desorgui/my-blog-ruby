require 'rails_helper'

RSpec.describe 'single post page contents', type: :feature do
  describe 'GET /users/:id/posts/:id' do
    before do
      user = User.create(name: 'Kenobi')
      post = Post.create(title: 'hello', text: 'writing testing in rails', author_id: user.id)
      visit "/users/#{user.id}/posts/#{post.id}"
    end
    it 'should have a post with text' do
      expect(page).to have_text('writing testing in rails')
    end
  end
end
