class Customer < ActiveRecord::Base
    validates :phone, uniqueness: { message: "already Signed In!" }
    validates :name,  presence: true, length: { maximum: 25 }
    validates :phone, presence: true, length: { maximum: 10, minimum: 10 }
    
end
