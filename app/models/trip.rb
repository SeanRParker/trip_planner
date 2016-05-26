class Trip < ActiveRecord::Base
  serialize :items, Array
  has_many :locations
end
