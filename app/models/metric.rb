class Metric < ActiveRecord::Base
  belongs_to :pad
  acts_as_list
validates_presence_of :title
end
