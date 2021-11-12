# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :category
  validates :title, presence: true
  has_one_attached :picture
  # validates :body, length: { minimum: 100 }

  def preview_text
    limit = if body.include? "\n"
              body.index "\n"
            else
              400
            end
    body[0..limit]
  end
end
