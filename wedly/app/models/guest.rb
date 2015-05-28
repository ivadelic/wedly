class Guest < ActiveRecord::Base
  belongs_to :attendee_user, class_name: "User"
  belongs_to :wedding
  belongs_to :container
  belongs_to :food
  has_many :events, through: :containers
end
