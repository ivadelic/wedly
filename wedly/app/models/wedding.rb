class Wedding < ActiveRecord::Base
  validate :one_wedding_per_user, :on => :create

  has_many :comments
  has_many :events
  has_many :invitations
  has_many :containers, through: :events
  belongs_to :user
  has_many :guests
  has_many :registries
  has_many :foods
  has_many :playlists
  has_many :songs, through: :playlists

  mount_uploader :social_cover_photo, PhotosUploader
  mount_uploader :social_partner2_photo, PhotosUploader
  mount_uploader :social_partner1_photo, PhotosUploader
  mount_uploader :photo_collection_1, PhotosUploader
  mount_uploader :photo_collection_2, PhotosUploader
  mount_uploader :photo_collection_3, PhotosUploader
  # has_many :attendee_users, through: :invitations, class_name: "User"

  accepts_nested_attributes_for :containers, :reject_if => :all_blank, :allow_destroy => true
  accepts_nested_attributes_for :events, :reject_if => :all_blank, :allow_destroy => true
  accepts_nested_attributes_for :guests, :reject_if => :all_blank, :allow_destroy => true
  accepts_nested_attributes_for :registries, :reject_if => :all_blank, :allow_destroy => true
  accepts_nested_attributes_for :invitations, :reject_if => :all_blank

  before_create :generate_token

  private
  def generate_token
    p1 = self.partner_1.split(' ')
    p2 = self.partner_2.split(' ')
    self.token = (p1[0] + p2[0] + Time.now.year.to_s).downcase
  end

  def one_wedding_per_user
    if Wedding.find_by(user_id: self.user_id)
      self.errors[:user] = "Can't have more than one wedding!"
      false
    else
      true
    end
  end
end
