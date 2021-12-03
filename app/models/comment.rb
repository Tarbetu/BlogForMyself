# frozen_string_literal: true

# This model allows commeting on posts
class Comment < ApplicationRecord
  belongs_to :post
  validates :body, presence: true
  validates :commenter, presence: true
end
