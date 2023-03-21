class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :likes
  has_many :comments
  has_rich_text :content

  after_save :increment_post_counter
  after_destroy :decrement_post_counter

  validates :title, presence: true
  validates :title, length: { maximum: 250, too_long: '%<max> characters is the maximum allowed' }
  validates :comments_counter, :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  # include PgSearch::Model
  # belongs_to :user
  # pg_search_scope :search_by_title,
  #                 against: [
  #                   [:title, 'A'],
  #                   [:body, 'C']
  #                 ],
  #                 associated_against: {
  #                   user: { name: 'B' }
  #                 },
  #                 using: {
  #                   tsearch: { prefix: true, any_word: true },
  #                   trigram: {
  #                     only: [:title],
  #                     threshold: 0.25
  #                   }
  #                 }

  # validates :title, presence: true, length: { maximum: 100 }
  # validates :body, presence: true, length: { minimum: 50, maximum: 5000 }

  after_initialize do |post|
    post.likes_counter = 0
    post.comments_counter = 0
  end

  def recent_comments
    Comment.where(post_id: self).order('created_at DESC').limit(1)
  end

  private

  def increment_post_counter
    author.increment!(:post_counter)
  end

  def decrement_post_counter
    author.decrement!(:post_counter)
  end
end
