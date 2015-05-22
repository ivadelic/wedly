class User < ActiveRecord::Base
  authenticates_with_sorcery!

  belongs_to :wedding
  has_many :guests

  validates :password, length: { minimum: 4 }
  validates :password, confirmation: true
  validates :password_confirmation, presence: true
  validates :email, uniqueness: true
end
