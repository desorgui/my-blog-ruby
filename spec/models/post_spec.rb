require 'rails_helper'

RSpec.describe Post, type: :model do
  user = User.create(name: 'Desor', post_counter: 3)
  subject { Post.create(title: 'helllo', text: 'writing testing in rails', author_id: user.id) }

  before { subject.save }

  it 'the posts should not be nil' do
    expect(subject).to_not be nil
  end

  it 'post counter should not be nil' do
    expect(user.post_counter).to_not be nil
  end
end
