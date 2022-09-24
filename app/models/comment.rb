class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :author, class_name: 'User'

  after_save :update_comments_counter

  validates :text, presence: true

  def update_comments_counter
    post.increment!(:comments_counter)
  end

  private :update_comments_counter
end
