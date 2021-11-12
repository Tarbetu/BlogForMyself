# frozen_string_literal: true

class LinkComponent < ViewComponent::Base
  def initialize(title:, link:)
    @title = title
    @link = link
  end

end
