# frozen_string_literal: true

# :nodoc:
class ApplicationController < ActionController::Base
  include Clearance::Controller
  include Pagy::Backend
end
