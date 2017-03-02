module EventsHelper
  def type_of
    if self.custom_event.present?
      return "custom"
    elsif self.training.present?
      return "training"
    elsif self.transfer.present?
      return "transfer"
    elsif self.visit.present?
      return "visit"
    else
      return "undefined"
    end
  end

end
