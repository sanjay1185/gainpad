class Pad < ActiveRecord::Base
  belongs_to :user
  has_many :metrics ,:dependent=>:destroy
end
