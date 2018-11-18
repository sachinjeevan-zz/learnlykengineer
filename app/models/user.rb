class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  attr_accessible :email, :name
  has_many :authorizations
validates :name, :email, :presence => true
  devise :database_authenticatable, :registerable, :confirmable, :trackable,
         :recoverable, :rememberable, :validatable, :omniauthable
         
        def self.create_with_omniauth(auth)
   create! do |user|
     user.provider = auth['provider']
     user.uid = auth['uid']
     if auth['info']
       user.name = auth['info']['name'] || ""
       user.email = auth['info']['email'] || ""
     end
   end
 end

def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end
end
