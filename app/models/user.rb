class User < ActiveRecord::Base
  # To use devise-twitter don't forget to include the :twitter_oauth module:
  # e.g. devise :database_authenticatable, ... , :twitter_oauth

  # IMPORTANT: If you want to support sign in via twitter you MUST remove the
  #            :validatable module, otherwise the user will never be saved
  #            since it's email and password is blank.
  #            :validatable checks only email and password so it's safe to remove

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :omniauthable, :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :school, :password, :password_confirmation, :remember_me
  
  has_many :professorratings
   def self.find_for_facebook_oauth(access_token, signed_in_resource=nil)
  data = access_token['extra']['user_hash']
  if user = User.find_by_email(data["email"])
    user
  else # Create an user with a stub password. 
    User.create!(:email => data["email"]) 
  end
end 
end
