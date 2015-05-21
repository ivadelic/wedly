class Event < ActiveRecord::Base
  belongs_to :wedding
  has_many :containers
  has_many :guests, through: :containers
  has_many :foods
end
