# frozen_string_literal: true

# A lister for Posts.
class PostListComponent < ViewComponent::Base
  def initialize(posts:, pagy:)
    @posts = posts
    @pagy  = pagy
  end
end
