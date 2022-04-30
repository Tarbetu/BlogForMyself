# frozen_string_literal: true

# The links for the books_sidebar_component
class BookLinkComponent < ViewComponent::Base
  def initialize(book, chapter_number)
    @book = book
    @chapter_number = chapter_number
    @title = chapter_number.zero? ? 'Önsöz' : "Bölüm #{@chapter_number}"
  end
end
