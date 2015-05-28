class Event < ActiveRecord::Base
  geocoded_by :full_address
  after_validation :geocode

  belongs_to :wedding
  has_many :containers
  has_many :guests, through: :containers
  has_many :foods

  accepts_nested_attributes_for :containers

  def full_address
    "#{address_line_1}, #{city}, #{province} #{country}"
  end
end
