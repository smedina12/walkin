class User < ActiveRecord::Base
    validates :phone, uniqueness: { message: "Already Exist" }
 before_save :timestamp
    attr_accessor :remember_token
    validates :name,  presence: true, length: { maximum: 25 }
    validates :lastName, presence: true, length: { maximum: 25 }
    validates :phone, presence: true, length: { maximum: 10, minimum: 10 }


  def timestamp
   self.lastLogin = DateTime.now 
  end


    
 # Returns a random token.
  def User.new_token
    SecureRandom.urlsafe_base64
  end
  
   def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
   end
   
   def update_tracked_fields!(request)
    old_signin = self.last_sign_in_at
    super
    if self.last_sign_in_at != old_signin
      Audit.create :user => self, :action => "login"
    end
   end

end
