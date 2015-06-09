class Song < ActiveRecord::Base
  belongs_to :playlist
  has_many :wedding, through :playlist
end
