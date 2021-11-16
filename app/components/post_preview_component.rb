# frozen_string_literal: true

def background_color_class(color)
  "bg-#{color}-100 dark:bg-#{color}-800"
end

COLORS = [
  background_color_class("red"),
  background_color_class("pink"),
  background_color_class("purple"),
  background_color_class("indigo"),
  background_color_class("yellow")
].freeze

# :nodoc:
class PostPreviewComponent < ViewComponent::Base
  with_collection_parameter :post

  def initialize(post:)
    @post         = post
    @preview_text = post.preview_text
    @picture      = nil # Just for now
    @background   = COLORS.sample
  end
end
