class PadsController < ApplicationController
  before_filter :find_user  
  layout "application"
  def new

    @metrics=Metric.find(:all,:conditions=>["pad_id is NULL"],:order=>:position)
    @metrics.each do |metric|
      metric.destroy
    end
    @metrics=Metric.find(:all,:conditions=>["pad_id is NULL"],:order=>:position)
    @pad = Pad.new
    @metric = Metric.new
  end


  def edit
    @pad=Pad.find(params[:id])
    @metric = Metric.new
    @metrics=@pad.metrics.sort{|x,y| x.position <=> y.position }
  end

  def create    
    if params[:commit]=="Create Pad"
      params[:pad].delete(:metric)
      params[:pad].delete(:nil_class)
      @pad=Pad.new(params[:pad])
      @pad.user=current_user
      @metrics=Metric.find(:all,:conditions=>["pad_id is NULL"],:order=>:position)
      @metric=Metric.new
      if @pad.save
        flash[:notice] ="Pad has been created sucessfully."
        for metric in @metrics
          metric.pad=@pad
          metric.save
        end
        redirect_to(:action=>"index",:controller=>"dashboard",:id=>current_user)
      else
        render :action=>"new"
      end
    end
  end

  def update
    @pad=Pad.find(params[:id])
    params[:pad].delete(:metric)
    @pad.update_attributes(params[:pad])
    flash[:notice] ="Pad has been updated sucessfully."
    redirect_to(:action=>"index",:controller=>"dashboard",:id=>current_user)
  end

  def destroy
    Pad.destroy(params[:id])
    flash[:notice] ="Pad has been deleted sucessfully."
    @pads=@user.pads
    redirect_to :controller=>"dashboard",:action=>"index"
  end

  protected
  def find_user
    @user = User.find(session[:user_id])
  end

 
end
