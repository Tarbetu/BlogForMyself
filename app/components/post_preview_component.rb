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
  def initialize(title:, body:, picture:)
    @title      = title
    @body       = body
    @picture    = picture
    @background = COLORS.sample
  end
end
