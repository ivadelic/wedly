class User < ActiveRecord::Base
  has_many :guest_specs
  belongs_to :wedding
end
