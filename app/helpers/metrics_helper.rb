module MetricsHelper
  def error_message(metric)
      @msg=[]
       @msg="<b>Metric : </b>\n<ul>"
      for error in metric.errors
        @msg << "<li>Metric"
       for err in error
         @msg <<  " " + err + " "
       end
       @msg << "</li></ul>\n"
      end
  end 
end
