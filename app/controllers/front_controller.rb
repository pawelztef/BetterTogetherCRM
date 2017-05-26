class FrontController < ActionController::Base
  layout 'login'

  def new
    @volunteer = Volunteer.new
    @location = @volunteer.build_location
  end

  def edit
  end

  def create
    # @volunteer = Volunteer.new(volunteer_params)
    # if @volunteer.save
      # gflash success: 'Volunteer was successfully created.'
      # redirect_to volunteers_url
    # else
      # gflash error: 'There was a problem while creating volunteer.'
      # render 'new'
    # end
  end

end
