# frozen_string_literal: true

# Posts are classic blog posts, as you know.
# The first paragraph is preview text.
# The first image is repoussoir for post preview.
# When a post is created, the "append_new_post" method updates the page
class Post < ApplicationRecord
  belongs_to :category
  validates :title, presence: true
  validates :body, length: { minimum: 100 }
  has_rich_text :body

  after_create_commit :append_new_post

  def preview_text
    plain_text = body.to_plain_text
    limit = if plain_text.include? "\n"
              plain_text.index "\n"
            else
              400
            end
    plain_text[0..limit]
  end

  private

  def append_new_post
    broadcast_append_to(
      "postList",
      html: ApplicationController.render(
        PostPreviewComponent.new(self)
      )
    )
  end
end
