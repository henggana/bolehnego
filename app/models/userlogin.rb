class Userlogin

  include DataMapper::Resource
  #  require 'digest'
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  # :recoverable, :rememberable, :validatable
  devise :database_authenticatable, :registerable, :trackable

  
  
  ## Database authenticatable
  property :email,              String, :required => true, :length => 255
  property :encrypted_password, String, :required => true, :field => 'password', :length => 255

  ## Recoverable
  # property :reset_password_token,   String
  # property :reset_password_sent_at, DateTime

  ## Rememberable
  # property :remember_created_at, DateTime

  ## Trackable
  property :sign_in_count,      Integer, :default => 0
  property :current_sign_in_at, DateTime
  property :last_sign_in_at,    DateTime
  property :current_sign_in_ip, String
  property :last_sign_in_ip,    String

  ## Encryptable
  # property :password_salt, String

  ## Confirmable
  # property :confirmation_token,   String
  # property :confirmed_at,         DateTime
  # property :confirmation_sent_at, DateTime
  # property :unconfirmed_email,    String # Only if using reconfirmable

  ## Lockable
  # property :failed_attempts, Integer, :default => 0 # Only if lock strategy is :failed_attempts
  # property :unlock_token,    String # Only if unlock strategy is :email or :both
  # property :locked_at,       DateTime

  ## Token authenticatable
  # property :authentication_token, String, :length => 255

  #  property :id, String, :key => true, :length => 32, :default => lambda {|resource, property| Digest::MD5.hexdigest("#{email}#{Time.now}")  }

  property :id, Serial  
  
  belongs_to :usertype
  
  # return userlogin's usertype if no paramater passes, 
  # otherwise it matches userlogin's usertype with the paramater
  
  def role?(role=nil)
    if role
      return !!self.usertype.name==(role.to_s.gsub('_','-'))
    else
      self.usertype.name
    end
  end
  
end
