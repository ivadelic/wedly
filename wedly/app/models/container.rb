class Container < ActiveRecord::Base
  has_many :guests
  belongs_to :event
end
