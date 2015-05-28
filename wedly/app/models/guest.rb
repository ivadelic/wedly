class Guest < ActiveRecord::Base
  belongs_to :attendee_user, class_name: "User"
  belongs_to :wedding
  # belongs_to :wedding, through: :attendee_user
  belongs_to :container
  has_many :events, through: :containers
end


