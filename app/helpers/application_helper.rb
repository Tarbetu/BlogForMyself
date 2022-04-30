# frozen_string_literal: true

module ApplicationHelper
  include Pagy::Frontend

  def page_title
    seperator = '-'
    name = 'Emrecan Şuşter'
    if @post
      "#{@post.title} #{seperator} #{name}"
    elsif @category
      "#{@category.name} #{seperator} #{name}"
    elsif @book && @chapter_number
      "#{@book.name} - #{@chapter_number.zero? ? 'Önsöz' : @chapter_number}"
    else
      name
    end
  end
end
