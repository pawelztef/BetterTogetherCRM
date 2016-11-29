module ApplicationHelper
  def logout_link user
    if user
      link_to 'Log out', '/logout'
    end
  end
end
