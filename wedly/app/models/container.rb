class Container < ActiveRecord::Base
  has_many :guest_specs
  belongs_to :event
end
