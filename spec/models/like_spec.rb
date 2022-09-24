require 'rails_helper'

RSpec.describe Like, type: :model do
  user = User.create(name: 'Desor', post_counter: 3)
  post = Post.create(title: 'helllo', text: 'writing testing in rails', author_id: user.id)
  subject { Like.create(author_id: user.id, post_id: post.id) }

  before { subject.save }

  it 'the likes should not be nil' do
    expect(subject).to_not be nil
  end

  it 'like counter should not be nil' do
    post = Post.create(title: 'Breaking news', text: 'writing testing in rails', author_id: user.id)
    expect(post.likes_counter).to_not be nil
  end
end
