<<<<<<< HEAD
# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :category
  validates :title, presence: true
  has_one_attached :picture
  # validates :body, length: { minimum: 100 }
=======
class Post < ApplicationRecord
  belongs_to :category
>>>>>>> 0550685dbe3bb9c3ff3aa298a3def16317b458f2
end
