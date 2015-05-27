class Food < ActiveRecord::Base
  belongs_to :wedding
  has_many :guests
end
