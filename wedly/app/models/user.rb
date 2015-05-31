class User < ActiveRecord::Base
  geocoded_by :full_address
  after_validation :geocode
  after_create :save_recipient_id_to_invitation

  authenticates_with_sorcery!
  mount_uploader :photo, PhotosUploader
  has_many :comments
  has_many :weddings, through: :comments
  has_one :my_wedding, class_name: "Wedding"
  has_many :guests
  has_many :invitations
  has_many :attending_weddings, through: :invitations, source: :wedding

  validates :password, length: { minimum: 4 }
  validates :password, confirmation: true
  validates :password_confirmation, presence: true
  validates :email, uniqueness: true


  def full_address
    "#{address_line_1}, #{city}, #{province} #{country}"
  end

  def save_recipient_id_to_invitation
    invitation = Invitation.find_by_recipient_email(self.email)
    invitation.user = self
    invitation.save
  end
end
