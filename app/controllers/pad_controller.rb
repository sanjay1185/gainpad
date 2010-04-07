class PadController < ApplicationController
  before_filter :find_user  

  def new

 @metrics=Metric.find(:all,:conditions=>["pad_id is NULL"],:order=>:position)
  if request.xml_http_request?
    p ">>>>>>>>>>>>>>>>"
    p params
      
  else
    @metrics = Metric.find(:all,:conditions=>["pad_id is NULL"]).sort{|x,y| x.position <=> y.position }
    @pad = Pad.new
    @metric = Metric.new
    end
  end

  def edit
    @pad=Pad.find(params[:id])
    @metrics=@pad.metrics.sort{|x,y| x.position <=> y.position }
  end

  def create    
    if params[:commit]=="Create Metric"
      @metric=Metric.new(params[:metric])
      @metric.save
      @metrics=Metric.find(:all,:conditions=>["pad_id is NULL"],:order=>:position)
      render :action=>"new"
    elsif params[:commit]=="Create Pad"
      @pad=Pad.new(params[:pad])
      @pad.user=current_user
      @pad.save
      @metrics=Metric.find(:all,:conditions=>["pad_id is NULL"],:order=>:position)
      for metric in @metrics
        metric.pad=@pad
        metric.save
      end
      redirect_to(:action=>"index",:controller=>"dashboard",:id=>current_user)
    end
  end

  def update

  end

  def add_metric
    p "?////////////////"
  end


  protected
  def find_user
    @user = current_user
  end

 
end
