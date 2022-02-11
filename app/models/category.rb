# frozen_string_literal: true

# This model contains posts, also can be used for static pages
class Category < ApplicationRecord
  has_many :posts
  validates :name, length: { in: 5..20 }
end
