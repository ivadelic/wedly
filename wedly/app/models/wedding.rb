class Wedding < ActiveRecord::Base
  has_many :events
  has_many :containers, through: :events
  belongs_to :user
  has_many :guests
  has_many :attendee_users, through: :guests, class_name: "User"

  accepts_nested_attributes_for :events
  accepts_nested_attributes_for :guests

  before_create :generate_token

  private
  def generate_token
    p1 = self.partner_1.split(' ')
    p2 = self.partner_2.split(' ')
    self.token = (p1[0] + p2[0] + Time.now.year.to_s).downcase
  end
  # def is_admin?(the_user)
  #   the_user == user || the_user == other_user
  # end
  # @wedding.is_admin?(current_user)
end

