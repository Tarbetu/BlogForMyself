# frozen_string_literal: true

# This model is managed by Clearance
# Users should only created by console and this user must confirmed automatically.
class User < ApplicationRecord
  include Clearance::User

  after_create :confirm_user

  def send_confirmation_email; end

  private

  def confirm_user
    confirm_email!
  end
end
