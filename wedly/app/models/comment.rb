class Comment < ActiveRecord::Base
  belongs_to :wedding
  belongs_to :user
  belongs_to :guest
end
