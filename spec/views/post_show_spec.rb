require 'rails_helper'

RSpec.describe 'single post page contents', type: :feature do
  before do
    @user = User.create(name: 'Jeff', photo: 'https://unsplash.com/photos/F_-0BxGuVvo0', bio: 'Teacher from Mexico.')
    post = Post.create(author: @user, title: 'Hello', text: 'This is my first post')
    Comment.create(post: post, author: @user, text: 'Hi Desor!')

    @post = Post.where(author_id: @user.id).first
    @comment = Comment.where(post_id: post.id).first

    visit "/users/#{@user.id}/posts/#{@post.id}"
  end

  it 'should show a post\'s title' do
    expect(page).to have_content(@post.title)
  end

  it 'should show who wrote the post' do
    expect(page).to have_content(@user.name)
  end

  it 'should show how many comments a post has' do
    expect(page).to have_content(@post.comments_counter)
  end

  it 'should show how many likes a post has' do
    expect(page).to have_content(@post.likes_counter)
  end

  it 'should show a post\'s body' do
    expect(page).to have_content(@post.text)
  end

  it 'should show the username of each commentor' do
    expect(page).to have_content(@comment.author.name)
  end

  it 'should show the comment each commentor left.' do
    expect(page).to have_content(@comment.text)
  end
end
