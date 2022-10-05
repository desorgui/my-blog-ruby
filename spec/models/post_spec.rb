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

  # it 'check if five most recent comments have some values' do
  #   post = Post.create(title: 'Breaking news', text: 'writing testing in rails', author_id: user.id)

  #   Comment.create(author_id: user.id, post_id: post.id, text: 'this is a comment')
  #   Comment.create(author_id: user.id, post_id: post.id, text: 'this is a comment')
  #   Comment.create(author_id: user.id, post_id: post.id, text: 'this is a comment')
  #   Comment.create(author_id: user.id, post_id: post.id, text: 'this is a comment')
  #   Comment.create(author_id: user.id, post_id: post.id, text: 'this is a comment')
  #   Comment.create(author_id: user.id, post_id: post.id, text: 'this is a comment')

  #   expect(post.five_most_recent_comments).to_not be nil
  # end

  # it 'check if comments return value length' do
  #   post = Post.create(title: 'Breaking news', text: 'writing testing in rails', author_id: user.id)

  #   Comment.create(author_id: user.id, post_id: post.id, text: 'this is a comment')
  #   Comment.create(author_id: user.id, post_id: post.id, text: 'this is a comment')
  #   Comment.create(author_id: user.id, post_id: post.id, text: 'this is a comment')
  #   Comment.create(author_id: user.id, post_id: post.id, text: 'this is a comment')
  #   Comment.create(author_id: user.id, post_id: post.id, text: 'this is a comment')
  #   Comment.create(author_id: user.id, post_id: post.id, text: 'this is a comment')

  #   expect(post.five_most_recent_comments.length).to eq(5)
  # end
end
