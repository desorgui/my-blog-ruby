require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.create(name: 'Desor', post_counter: 3) }

  before { subject.save }

  it 'the user should not be nil' do
    expect(subject).to_not be nil
  end

  it 'post counter should not be nil' do
    expect(subject.post_counter).to_not be nil
  end

  it 'check if three most recent posts have some values' do
    user = User.create(name: 'Desor', post_counter: 3)

    Post.create(title: 'helllo', text: 'writing testing in rails', author_id: user.id)
    Post.create(title: 'helllo', text: 'writing testing in rails', author_id: user.id)
    Post.create(title: 'helllo', text: 'writing testing in rails', author_id: user.id)
    Post.create(title: 'helllo', text: 'writing testing in rails', author_id: user.id)
    Post.create(title: 'helllo', text: 'writing testing in rails', author_id: user.id)
    Post.create(title: 'helllo', text: 'writing testing in rails', author_id: user.id)

    expect(user.last_three_posts).to_not be nil
  end

  it 'check if posts return value length' do
    user = User.create(name: 'Desor', post_counter: 3)

    Post.create(title: 'helllo', text: 'writing testing in rails', author_id: user.id)
    Post.create(title: 'helllo', text: 'writing testing in rails', author_id: user.id)
    Post.create(title: 'helllo', text: 'writing testing in rails', author_id: user.id)
    Post.create(title: 'helllo', text: 'writing testing in rails', author_id: user.id)
    Post.create(title: 'helllo', text: 'writing testing in rails', author_id: user.id)
    Post.create(title: 'helllo', text: 'writing testing in rails', author_id: user.id)

    expect(user.last_three_posts.length).to eq(3)
  end
end