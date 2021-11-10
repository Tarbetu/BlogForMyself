<<<<<<< HEAD
# frozen_string_literal: true

class Category < ApplicationRecord
  has_many :posts
  validates :name, length: { minimum: 5 }
=======
class Category < ApplicationRecord
>>>>>>> 0550685dbe3bb9c3ff3aa298a3def16317b458f2
end
