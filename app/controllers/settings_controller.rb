class SettingsController < ApplicationController
  def index 
    @settings = Setting.pull
  end
  def edit 
    @settings = Setting.pull
  end
  def update
    # byebug
    @setting = Setting.find(params[:id])
    if @setting.update(settings_params)
      gflash success: "Settings have been saved sucessfully."
      redirect_to settings_url 
    else 
      gflash error: "Some errors occured and settings have been not saved."
      redirect_to settings_url
    end
  end

  def settings_params
    params.require(:setting).permit(:id,
                                   :dashboard,
                                   :message,
                                   :volunteer,
                                   :dog,
                                   :task,
                                   :business,
                                   :statistic,
                                   :event,
                                   :setting)
  end
end
