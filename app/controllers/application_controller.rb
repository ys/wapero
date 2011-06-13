class ApplicationController < ActionController::Base
  protect_from_forgery
  def per_page
    16
  end
end
