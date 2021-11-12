# frozen_string_literal: true

class NavbarComponent < ViewComponent::Base
  def initialize(list_of_links:)
    @list_of_links = list_of_links
  end
end
