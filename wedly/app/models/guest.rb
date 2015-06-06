class Guest < ActiveRecord::Base
  belongs_to :attendee_user, class_name: "User"
  belongs_to :wedding
  # belongs_to :wedding, through: :attendee_user
  belongs_to :container
  has_and_belongs_to_many :containers
  belongs_to :food
  has_many :events, through: :containers

  def rsvp_string
    if rsvp
      "Confirm"
    else
      "Regret"
    end
  end

end


