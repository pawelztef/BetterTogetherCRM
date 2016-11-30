module ApplicationHelper
  def logout_link 
    if current_moderator 
      link_to 'Log out', '/logout'
    end
  end
  def welcome_msg
    if current_moderator
      "Welcome #{current_moderator.fullname}"
    end
  end
end
