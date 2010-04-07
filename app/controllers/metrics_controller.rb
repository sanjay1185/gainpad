class MetricsController < ApplicationController

  def index
     @metrics=Metric.find(:all,:conditions=>["pad_id = ?",params[:pad_id]])
  end

  def new

  end

  def create
    
  end
  def edit_row
@metric=Metric.find(params[:id])
#render(:update) do |page|
#      page.replace_html "metric_#{@metric.id}", :partial => 'form', :object => @metric
#    end
render :partial=>"form"
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
