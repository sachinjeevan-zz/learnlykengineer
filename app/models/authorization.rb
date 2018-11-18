class Authorization < ApplicationRecord

attr_accessible :provider, :uid, :user_id
  belongs_to :user
validates :provider, :uid, :presence => true
end
