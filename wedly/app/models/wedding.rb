class Wedding < ActiveRecord::Base
  has_many :events
  has_many :containers, through: :events
  belongs_to :user
  has_many :guests
  has_many :registries
  has_many :attendee_users, through: :guests, class_name: "User"

  accepts_nested_attributes_for :events, :reject_if => :all_blank, :allow_destroy => true
  accepts_nested_attributes_for :guests, :reject_if => :all_blank, :allow_destroy => true
  accepts_nested_attributes_for :registries, :reject_if => :all_blank, :allow_destroy => true

end