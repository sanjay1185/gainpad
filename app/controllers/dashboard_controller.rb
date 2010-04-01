class DashboardController < ApplicationController
  before_filter :find_user

  def index

  end

  def new

  end

  def edit
    
  end

  
  protected
  def find_user
    @user = User.find(params[:id])
  end
end
