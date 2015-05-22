class Wedding < ActiveRecord::Base
  has_many :events
  has_many :users
  has_many :guests

  accepts_nested_attributes_for :events
  accepts_nested_attributes_for :guests

end