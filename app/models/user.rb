class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :confirmable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts, foreign_key: 'author_id'
  has_many :likes, foreign_key: 'author_id'
  has_many :comments, foreign_key: 'author_id'
  # has_many :most_recent_posts, -> { order('created_at DESC').limit(2) }, class_name: 'Post'

  # validates :name, presence: true
  validates_numericality_of :post_counter, greater_than_or_equal_to: 0

  after_initialize do |user|
    user.post_counter = 0
  end

  def last_three_posts
    Post.where(author_id: self).order('created_at DESC').limit(3)
  end
end
