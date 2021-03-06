class Event < ActiveRecord::Base
  geocoded_by :full_address
  after_validation :geocode

  belongs_to :wedding
  has_many :containers
  has_many :guests, through: :containers

  accepts_nested_attributes_for :containers, :reject_if => :all_blank, :allow_destroy => true

  validates :name, presence: true

  def full_address
    "#{address_line_1}, #{city}, #{province} #{country}"
  end
end
