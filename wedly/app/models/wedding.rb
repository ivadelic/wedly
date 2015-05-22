class Wedding < ActiveRecord::Base
  has_many :events
  belongs_to :user
  has_many :guests
  has_many :attendee_users, through: guests, class_name: "User"

  accepts_nested_attributes_for :events
end