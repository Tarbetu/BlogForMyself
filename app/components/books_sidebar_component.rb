# frozen_string_literal: true

# This is an index for book
class BooksSidebarComponent < ViewComponent::Base
  def initialize(book:)
    @book = book
  end
end
