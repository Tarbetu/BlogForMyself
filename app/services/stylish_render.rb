# frozen_string_literal: true

# Renders markdowns into stylish form
class StylishRender < Redcarpet::Render::HTML
  def header(text, _header_level)
    ApplicationController.render(HeaderComponent.new.with_content(text), layout: false)
  end
end
