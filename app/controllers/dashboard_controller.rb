class DashboardController < ApplicationController
  def index
    @pads = Pad.all(:order => "created_at DESC")
    respond_to do |format|
      format.html
    end
  end
  
  def create
    @pad = Pad.create(:title => params[:title], 
      :description => params[:description])
    respond_to do |format|
      if @pad.save
        format.html {redirect_to pads_path}
      else
        flash[:notice] = "Pad failed to save."
        format.html {redirect_to pads_path}
      end
    end
  end
end
