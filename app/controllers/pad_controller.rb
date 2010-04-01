class PadController < ApplicationController
  before_filter :find_user

 def new
   @pad=Pad.new
   @metric=Metric.new
  end

  def edit

  end


  protected
  def find_user
    @user = User.find(params[:id])
  end
end
