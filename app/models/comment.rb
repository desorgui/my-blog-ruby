class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :author, class_name: 'User'

  after_save :increment_comments_counter

  validates :text, presence: true

  private

  def increment_comments_counter
    post.increment!(:comments_counter)
  end

  def update_comments_counter
    post.increment!(:comments_counter)
  end
end
