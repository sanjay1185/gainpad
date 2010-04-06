class Metric < ActiveRecord::Base
  belongs_to :pad
  acts_as_list

end
