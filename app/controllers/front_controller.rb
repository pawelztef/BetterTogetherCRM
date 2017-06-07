class FrontController < ActionController::Base
  layout 'login'

  def new
    @volunteer = Volunteer.new
    @location = @volunteer.build_location
  end

  def edit
  end

  def create
    @volunteer = Volunteer.new(volunteer_params)
    if @volunteer.save
      # send mail
      VolunteerMailer.welcome_mail(@volunteer).deliver
      flash[:success] = 'Volunteer was successfully created.'
    else
      flash[:notice] = 'Some errors prohibited You from being registered!'
      render 'new'
    end
  end

  def volunteer_params
    params.require(:volunteer).permit(:first_name,
                                      :last_name,
                                      :email,
                                      :phone1,
                                      :phone2, 
                                      location_attributes: [:line1, 
                                                            :line2,
                                                            :city,
                                                            :county,
                                                            :code,
                                                            :latitude,
                                                            :longitude,
                                                            :localizable_id,
                                                            :localizable_type])
  end

end
