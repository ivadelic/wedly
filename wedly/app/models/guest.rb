class Guest < ActiveRecord::Base
  belongs_to :user
  belongs_to :wedding

  belongs_to :container
  has_many :events, through: :containers
end
