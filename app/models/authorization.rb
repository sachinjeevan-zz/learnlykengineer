class Authorization < ApplicationRecord

attr_accessor :provider, :uid, :user_id
  belongs_to :user
validates :provider, :uid, :presence => true
end
