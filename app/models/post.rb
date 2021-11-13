# frozen_string_literal: true

# As you know, this is for blog posts.
class Post < ApplicationRecord
  belongs_to :category
  validates :title, presence: true
  validates :body, length: { minimum: 100 }
  has_rich_text :body
  has_one_attached :picture

  def preview_text
    plain_text = body.to_plain_text
    limit = if plain_text.include? "\n"
              plain_text.index "\n"
            else
              400
            end
    plain_text[0..limit]
  end
end
