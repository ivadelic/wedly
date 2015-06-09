class Song < ActiveRecord::Base
  belongs_to :playlist
  has_many :weddings, through: :playlists

  validates :title, presence: true
end
