class User < ActiveRecord::Base
    attr_accessor :remember_token
     before_save { self.email = email.downcase }
    validates :name,  presence: true, length: { maximum: 25 }
    validates :lastName, presence: true, length: { maximum: 25 }
    validates :phone, presence: true, length: { maximum: 11 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 225 },
                      format: { with: VALID_EMAIL_REGEX },
                      uniqueness: { case_sensitive: false }
 # Returns a random token.
  def User.new_token
    SecureRandom.urlsafe_base64
  end
  
   def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
   end
end
