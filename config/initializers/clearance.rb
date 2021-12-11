# frozen_string_literal: true

Clearance.configure do |config|
  config.mailer_sender = "no_ones@mail.com"
  config.rotate_csrf_on_sign_in = true
  config.allow_sign_up = false
end
