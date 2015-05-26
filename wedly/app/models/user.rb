class User < ActiveRecord::Base

  geocoded_by :full_address
  after_validation :geocode

  authenticates_with_sorcery!

  has_one :my_wedding, class_name: "Wedding"
  has_many :guests
  has_many :weddings, through: :guests

  validates :password, length: { minimum: 4 }
  validates :password, confirmation: true
  validates :password_confirmation, presence: true
  validates :email, uniqueness: true

  def full_address
    "#{address_line_1}, #{city}, #{province} #{country}"
  end

end
