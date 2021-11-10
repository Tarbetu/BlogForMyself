# frozen_string_literal: true

# :nodoc:
class PostPreviewComponent < ViewComponent::Base
  def initialize(title:, body:, picture:)
    limit = if body.length < 100
              body.length
            else
              100
            end
    @title   = title
    @body    = body[0..limit]
    @picture = picture
  end
end
