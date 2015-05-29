class User < ActiveRecord::Base
  geocoded_by :full_address
  after_validation :geocode

  authenticates_with_sorcery!

  has_many :comments
  has_one :my_wedding, class_name: "Wedding"
  has_many :guests
  has_many :weddings, through: :guests
  belongs_to :invitation

  validates :password, length: { minimum: 4 }
  validates :password, confirmation: true
  validates :password_confirmation, presence: true
  validates :email, uniqueness: true

  attr_accessor :invitation_token

  def full_address
    "#{address_line_1}, #{city}, #{province} #{country}"
  end

  def invitation_token
    invitation.token if invitation
  end

  def invitation_token=(token)
    self.invitation = Invitation.find_by_token(token)
  end
end
