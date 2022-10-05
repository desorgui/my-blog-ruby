require 'rails_helper'

RSpec.describe 'single user page contents', type: :feature do
  # describe 'GET /users/:id' do
  #   before do
  #     user2 = User.create(name: 'Kenobi')
  #     visit "/users/#{user2.id}"
  #   end
  #   it 'have here is a single of user text in show.html.erb' do
  #     expect(page).to have_text('user Name')
  #   end
  #   it 'It should have a user profile image' do
  #     expect(page).to have_css('img')
  #   end
  # end
  # RSpec.describe 'user_show', type: :feature do
    before do
    
    # user = User.find_by(name: 'Tom')
    @user = User.create(name: 'Jeff', photo: 'https://unsplash.com/photos/F_-0BxGuVvo0', bio: 'Teacher from Mexico.')
    Post.create(author: @user, title: 'Hello', text: 'This is my first post')
    Post.create(author: @user, title: 'Breaking news', text: 'This is my first post')
    Post.create(author: @user, title: 'Jocking', text: 'This is my second post')
    Post.create(author: @user, title: 'Health', text: 'This is my third post')
    Post.create(author: @user, title: 'Eating', text: 'This is my first post')
    Post.create(author: @user, title: 'Selling', text: 'This is my fourth')

    @posts = @user.last_three_posts

    visit "/users/#{@user.id}"

    end
  
    it 'should show the user\'s profile picture' do
      expect(page).to have_xpath("//img[contains(@src,'#{@user.photo}')]")
    end
  
    it 'should show the user\'s username' do
      expect(page).to have_content(@user.name)
    end
  
    it 'shoud show the number of posts the user has written' do
      expect(page).to have_content("Number of posts: #{@user.post_counter}")
    end
  
    it 'should show the user\'s bio' do
      expect(page).to have_content(@user.bio)
    end
  
    it 'should show the user\'s first 3 posts' do
      expect(page).to have_content(@posts[0].title)
      expect(page).to have_content(@posts[1].title)
      expect(page).to have_content(@posts[2].title)
    end
  
    it 'should show a button that lets me view all of a user\'s posts' do
      button = page.find('button#all-posts')
      expect(button).to have_content('See all posts')
    end
  
    it "redirect to the post's show page when clicking on a specific user\s post" do
      click_on @posts.first.title
      expect(current_path).to eq("/users/#{@user.id}/posts/#{@posts.first.id}")
    end
  
    it "redirect to the post's index page when clicking see all posts button" do
      click_link 'See all posts'
      expect(current_path).to eq("/users/#{@user.id}/posts")
    end
end
