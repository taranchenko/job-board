module ApplicationHelper
  def owned_by_current_user?(resource)
    resource.user && current_user && resource.user.id == current_user.id
  end
end
