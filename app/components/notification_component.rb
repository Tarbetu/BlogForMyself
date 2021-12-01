# frozen_string_literal: true

# This component idea taken from:
# https://dev.to/citronak/modern-rails-flash-messages-part-1-viewcomponent-stimulus-tailwind-css-3alm
class NotificationComponent < ViewComponent::Base
  def initialize(message)
    @message = message
  end
end
