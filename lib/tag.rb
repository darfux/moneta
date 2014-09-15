class Tag < ActiveRecord::Base
  has_many :words
  validates_uniqueness_of :name
end