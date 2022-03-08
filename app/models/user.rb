# frozen_string_literal: true

# This model is managed by Clearance
# Users should only created by console and this user must confirmed automatically.
class User < ApplicationRecord
  include Clearance::User

  def send_confirmation_email; end
end
