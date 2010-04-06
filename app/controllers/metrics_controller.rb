class MetricsController < ApplicationController
  def new

  end

  def create
    p "????????????"
  end

def sort
  params[:metrics].each_with_index do |id, index|
    Metric.update_all(['position=?', index+1], ['id=?', id])
  end
  render :nothing => true
end


    protected
  def find_user
    @user = User.find(params[:id])
  end
end
