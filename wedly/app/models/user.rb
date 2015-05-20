class User < ActiveRecord::Base
  has_many :guests
  has_many :contrainers, through: :guests
  belongs_to :wedding
end
