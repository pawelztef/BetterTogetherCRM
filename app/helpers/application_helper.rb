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

  def event_type event
    if event.custom_event.present?
      return "custom event"
    elsif event.training.present?
      return "training"
    elsif event.transfer.present?
      return "transfer"
    elsif event.visit.present?
      return "visit"
    else
      return "undefined"
    end
  end

  def stringify_event_dates event
    date = event.start.to_date 
    if event.start.day == event.end.day
      "<span> One day event</span><br> <span>starts at: #{event.start.to_formatted_s(:short)}</span>".html_safe
    else
      "<span>Starts at: #{event.start.to_formatted_s(:short)}</span><br>Finishes on: #{event.end.to_formatted_s(:short)}".html_safe
    end
  end

end
