class Wedding < ActiveRecord::Base
  has_many :events
  has_many :users

  accepts_nested_attributes_for :events
end