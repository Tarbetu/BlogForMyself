# frozen_string_literal: true

class Category < ApplicationRecord
  has_many :posts
  validates :name, length: { minimum: 5 }
end
