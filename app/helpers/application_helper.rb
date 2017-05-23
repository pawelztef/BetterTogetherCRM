module ApplicationHelper
  def flash_class(name)
    case name
    when :success then 'alert-success'
    when :error   then 'alert-danger'
    when :warn    then 'alert-warning'
    when :info    then 'alert-info'
    when :alert   then 'alert-info'
    else 'alert-info'
    end
  end


  def nav_action_link(text, path, class_name = '', &block)
    path, class_name = text, path if block_given?

    if current_page?(path) || url_for(path).include?(action_name)
      class_name += ' active'
    end

    content_tag(:li, class: class_name) do
      if block_given?
        link_to path, &block
      else
        link_to text, path
      end
    end
  end

  def dropdown(path, options = {}, &block)
    options[:class] ||= ''
    options[:class] += ' dropdown'
    options[:class] += ' active' if url_for(path).include?(controller_name)

    content_tag :li, options do
      block.call
    end
  end
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

  def go_back
    link_to "Back", request.referer.present? ? request.referer : root_path, class: "nav-link"
  end

  def date d=Date.today
    d.strftime('%d %b %Y')
  end

end
