# frozen_string_literal: true

# Renders markdowns to html!
class MarkdownComponent < ViewComponent::Base
  def initialize(chapter_content:)
    markdown = Redcarpet::Markdown.new(StylishRender)
    @chapter_content = markdown.render(chapter_content)
  end
end
