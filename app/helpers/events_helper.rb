module EventsHelper

  def display_other event, builder_var
    if params[:action] == "edit" && !(event.training.other.empty?)
      builder_var.input :other
    end
  end


end
