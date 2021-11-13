# frozen_string_literal: true

# As you know, this is for blog posts.
class Post < ApplicationRecord
  belongs_to :category
  validates :title, presence: true
  validates :body, length: { minimum: 100 }
  has_rich_text :body
  has_one_attached :picture

  def preview_text
    # limit = if body.include? "\n"
    #           body.index "\n"
    #         else
    #           400
    #         end
    # body[0..limit]
    limit = 400
    body[0..limit]
  end
end
