# frozen_string_literal: true

# This model allows commeting on posts
# Nothing special :)
class Comment < ApplicationRecord
  belongs_to :post
  validates :body, presence: true
  validates :commenter, presence: true
end
