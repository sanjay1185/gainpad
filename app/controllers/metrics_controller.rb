class MetricsController < ApplicationController

  def index
    @metrics=Metric.find(:all,:conditions=>["pad_id = ?",params[:pad_id]])
  end

  def new

  end

  def create
    @pad=Pad.find(params[:pad_id]) if params[:pad_id]
    @metric = Metric.new(params[:metric])
    if @metric.save
      flash[:message] ="Metric has been created sucessfully."
      
    end
    if @pad
      @pad_edit=true
      @metric.pad=@pad
      @metric.save
      @metrics=@pad.metrics
    else
      @pad=Pad.new
      @metrics=Metric.find(:all,:conditions=>["pad_id is NULL"],:order=>:position).sort{|x,y| x.position <=> y.position }
    end
    render :partial => 'pads/metric'
  end

  def edit
    p "nnnnnnnnnnnnnnnnnnnnn"
    @metric=Metric.find(params[:id])
    @pad=@metric.pad
    @metrics=@pad.metrics
    render :partial=>"metric"
  end

  def edit_row
    @metric=Metric.find(params[:id])
    #render(:update) do |page|
    #      page.replace_html "metric_#{@metric.id}", :partial => 'form', :object => @metric
    #    end
    render :partial=>"form"
  end

  def destroy
    @metric=Metric.find(params[:id])
    @metrics=Metric.find(:all,:conditions=>["pad_id = ?",@metric.pad_id])
    @metrics.delete @metric
    @metric.destroy
    render :partial=>"pads/metrics"
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
