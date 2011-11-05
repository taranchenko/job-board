module ApplicationHelper
  def belongs_to_current_user?(resource)
    resource.user && current_user && resource.user.id == current_user.id
  end
end
