module ApplicationHelper
  def logout_link 
    if current_moderator 
      link_to 'Log out', '/logout'
    end
  end
end
