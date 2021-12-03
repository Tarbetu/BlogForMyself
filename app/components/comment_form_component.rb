# frozen_string_literal: true

class CommentFormComponent < ViewComponent::Base
  def initialize(comment:)
    @comment = comment
  end
end
