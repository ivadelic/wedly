class Event < ActiveRecord::Base
  belongs_to :wedding
  has_many :containers
end
