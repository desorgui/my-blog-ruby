require 'rails_helper'

RSpec.describe 'Posts and post page contents', type: :feature do
  before do
    @user = User.create(name: 'Jeff', photo: 'https://unsplash.com/photos/F_-0BxGuVvo0', bio: 'Teacher from Mexico.')
    first_post = Post.create(author: @user, title: 'Hello', text: 'This is my first post')
    Post.create(author: @user, title: 'Breaking news', text: 'This is my first post')
    Post.create(author: @user, title: 'Jocking', text: 'This is my second post')
    Post.create(author: @user, title: 'Health', text: 'This is my third post')
    Post.create(author: @user, title: 'Eating', text: 'This is my first post')
    Post.create(author: @user, title: 'Selling', text: 'This is my fourth')

    Comment.create(post: first_post, author: @user, text: 'Hi Tom!')
    Comment.create(post: first_post, author: @user, text: 'Hi Tom!')

    @post = Post.where(author_id: @user.id).first
    @comment = @post.recent_comments

    visit "/users/#{@user.id}/posts"
  end

  it 'should see the user\'s profile picture' do
    expect(page).to have_xpath("//img[contains(@src,'#{@user.photo}')]")
  end

  it 'should show the user\'s username' do
    expect(page).to have_content(@user.name)
  end

  it 'should show the number of posts a user has written' do
    expect(page).to have_content("Number of posts: #{@user.post_counter}")
  end

  it 'should show a post\'s title' do
    expect(page).to have_content(@post.title)
  end

  it 'should show some of the post\'s body' do
    expect(page).to have_content(@post.text)
  end

  it 'should show the first comments on a post' do
    expect(page).to have_content(@comment[0].text)
  end

  it 'should show how many comments a post has' do
    expect(page).to have_content(@post.comments_counter)
  end

  it 'should show how many likes a post has' do
    expect(page).to have_content(@post.likes_counter)
  end

  it 'should show a section for pagination if there are more posts than fit on the view' do
    expect(page).to have_content('Pagination')
  end

  it 'redirect to the post\'s show page when clicking on a post' do
    click_on @post.title
    expect(current_path).to eq("/users/#{@user.id}/posts/#{@post.id}")
  end
end
