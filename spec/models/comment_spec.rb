require 'rails_helper'

RSpec.describe Comment, type: :model do
  user = User.create(name: 'Desor', post_counter: 3)
  post = Post.create(title: 'helllo', text: 'writing testing in rails', author_id: user.id)
  subject { Comment.create(author_id: user.id, post_id: post.id, text: 'this is a comment') }
    
  before { subject.save }
    
  it 'the comments should not be nil' do
    expect(subject).to_not be nil
  end
    
  it 'comment counter should not be nil' do
    post = Post.create(title: 'Breaking news', text: 'writing testing in rails', author_id: user.id)
    expect(post.comments_counter).to_not be nil
  end
end
