class MetricsController < ApplicationController
  def new

  end

  def create
    p "????????????"
  end
    protected
  def find_user
    @user = User.find(params[:id])
  end
end
