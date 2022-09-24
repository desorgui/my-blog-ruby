class User < ApplicationRecord
  has_many :posts, foreign_key: 'author_id'
  has_many :likes, foreign_key: 'author_id'
  has_many :comments, foreign_key: 'author_id'

  validates :name, presence: true

  after_initialize do |user|
    user.post_counter = 0
  end

  def last_three_posts
    Post.where(author: self).order(updated_at: :desc).first(3)
  end
end
