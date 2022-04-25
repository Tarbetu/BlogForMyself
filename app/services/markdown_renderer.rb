# frozen_string_literal: true

class MarkdownRenderer < Redcarpet::Render::HTML
  def header(text, header_level)
    ApplicationController.render(HeaderComponent.new.with_content(text), layout: false)
  end
end

