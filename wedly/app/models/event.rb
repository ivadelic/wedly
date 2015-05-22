class Event < ActiveRecord::Base
  geocoded_by :full_address
  after_validation :geocode, if: :full_address_changed?
  belongs_to :wedding
  has_many :containers
  has_many :guests, through: :containers
  has_many :foods

  def full_address
    "#{address_line_1} #{address_line_2}, #{city}, #{province} #{zip}"
  end
end
