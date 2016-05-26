class Address < ActiveRecord::Base
  belongs_to :location
  validates_uniqueness_of :address
end
