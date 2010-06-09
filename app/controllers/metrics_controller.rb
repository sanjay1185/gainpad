class MetricsController < ApplicationController

  def index
    @metrics=Metric.find(:all,:conditions=>["pad_id = ?",params[:pad_id]])
  end

  def new
    @metric=@metric.new
  end

  def create
    @pad=Pad.find(params[:pad_id]) if params[:pad_id]
    @metric = Metric.new(params[:metric])
    flash[:message] ="Metric has been created sucessfully." if @metric.save
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
    @metric=Metric.find(params[:id])
    if @metric.pad.nil?
      @pad=Pad.new
    else
      @pad=@metric.pad
    end
#    render :partial=>"pads/metric_form"
  end

  def update
    @metric = Metric.find(params[:id])
    if @metric.update_attributes(params[:metric])
      flash[:notice]="Metric updated"
    else
      @errors=@metric.errors
      @msg=[]
      @msg="There were problems with the following fields:\n<ul>"
      for error in @metric.errors
        @msg << "<li>Metric"
        for err in error
          @msg <<  " " + err + " "
        end
        @msg << "</li></ul>\n"
      end
    end
    
    if @metric.pad.nil?
      @pad=Pad.new
      @metrics=Metric.find(:all,:conditions=>["pad_id is NULL"],:order=>:position).sort{|x,y| x.position <=> y.position }
    else
      @pad=@metric.pad
      @metrics=@pad.metrics.sort{|x,y| x.position <=> y.position }
    end

  end

  def edit_row
    @metric=Metric.find(params[:id])
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
