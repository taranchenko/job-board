class ApplicationController < ActionController::Base
  protect_from_forgery

  def owned_by_current_user?(resource)
    resource.user && current_user && resource.user.id = current_user.id
  end
end
