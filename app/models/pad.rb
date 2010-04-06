class Pad < ActiveRecord::Base
  belongs_to :user
  has_many :metrics ,:dependent=>:destroy
  accepts_nested_attributes_for :metrics, :allow_destroy => true

end
