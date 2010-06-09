class DashboardController < ApplicationController

  before_filter :find_user,:delete_previous_metrics

  def index
    @pads=@user.pads
  end

  def new
    @pad=Pad.new
  end

  protected
  def find_user
    @user = User.find(session[:user_id])
  end

  def delete_previous_metrics
    Metric.destroy_all("pad_id is NULL")
  end
end
