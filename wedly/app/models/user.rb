class User < ActiveRecord::Base
  has_many :guest_specs
  has_many :contrainers, through: :guest_specs
  belongs_to :wedding
end
