class Playlist < ActiveRecord::Base
  belongs_to :wedding
  has_many :songs
end
