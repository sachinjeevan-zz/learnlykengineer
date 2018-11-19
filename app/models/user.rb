class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :trackable,
         :recoverable, :rememberable,:confirmable, :validatable, :omniauthable, :omniauth_providers => [:facebook]

         def self.new_with_session(params, session)
          super.tap do |user|
            if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
              user.email = data["email"] if user.email.blank?
            end
          end
        end

        def self.find_for_facebook_oauth(access_token, signed_in_resource=nil)
          data = access_token.extra.raw_info
          if user = User.where(:email => data.email)
            user
          else # Create a user with a stub password. 
            user = User.new(:email => data.email, :password => Devise.friendly_token[0,20])
            user.skip_confirmation!
            user.save! 
          end
        end
 end
