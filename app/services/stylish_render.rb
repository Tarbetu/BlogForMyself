# frozen_string_literal: true

# Renders markdowns into stylish form
class StylishRender < Redcarpet::Render::HTML
  def initialize(options = {})
    super options.merge(
      {
        hard_wrap: true,
        lax_spacing: true
      }
    )
  end

  def header(text, _header_level)
    render_component HeaderComponent.new.with_content(text)
  end

  def list(contents, _list_type)
    "<div id='konusma' class='my-2 p-2 bg-black dark:bg-white rounded text-white dark:text-black'>#{contents}</div>"
  end

  def list_item(text, _list_type)
    "<p>— #{text}</p>"
  end

  private

  def render_component(component)
    ApplicationController.render(component, layout: false)
  end
end
