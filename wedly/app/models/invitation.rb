class Invitation < ActiveRecord::Base
  belongs_to :wedding
  has_one :recipient, class_name: 'User'

  validates :recipient_email, presence: true
end

