class Invitation < ActiveRecord::Base
  belongs_to :wedding
  belongs_to :user

  validates :recipient_email, presence: true
end