# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :category
  validates :title, presence: true
  has_one_attached :picture
  # validates :body, length: { minimum: 100 }
end
