class Pad < ActiveRecord::Base
  belongs_to :user
  has_many :metrics ,:dependent=>:destroy, :autosave => true
  validates_presence_of :title
  accepts_nested_attributes_for :metrics, :allow_destroy => true

end
