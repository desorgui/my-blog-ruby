class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :likes
  has_many :comments

  after_save :update_post_counter

  validates :title, presence: true
  validates :title, length: { maximum: 250, too_long: '%<max> characters is the maximum allowed' }
  validates :comments_counter, :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  after_initialize do |post|
    post.likes_counter = 0
    post.comments_counter = 0
  end

  def update_post_counter
    author.increment!(:post_counter)
  end

  def recent_comments
    Comment.where(post_id: self).order('created_at DESC').limit(5)
  end
  
  private :update_post_counter
end
