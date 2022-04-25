# frozen_string_literal: true

# Posts are classic blog posts, as you know.
# The first paragraph is preview text.
# The first image is repoussoir for post preview.
# When a post is created, the "append_new_post" method updates the page
class Post < ApplicationRecord
  belongs_to :category
  has_many  :comments
  validates :title, presence: true
  validates :body, length: { minimum: 100 }
  has_rich_text :body

  # The main problem with these methods causes N+1 queries.
  # The "ActiveText" things cause this.
  def preview_text
    plain_text = body.to_plain_text
    return plain_text[0..400] unless plain_text.include? "\n"

    plain_text = plain_text.split("\n")

    plain_text.each do
      next if _1.blank?
      return _1 unless _1.starts_with?('[') && _1.ends_with?(']')
    end

    # Turkish: Error while creating post preview
    'Gönderi ön izlemesi oluşturulurken hata oluştu'
  end

  def preview_image
    body.embeds.find(&:image?)
  end
end
