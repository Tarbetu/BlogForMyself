# frozen_string_literal: true

# :nodoc:
class PostPreviewComponent < ViewComponent::Base
  with_collection_parameter :post

  def initialize(post:)
    @post         = post
    @preview_text = post.preview_text
    @picture      = post.preview_image
  end
end
