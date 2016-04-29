class User < ActiveRecord::Base
    validates :phone, uniqueness: { message: "Already Exist" }
    validates :name,  presence: true, length: { maximum: 25 }
    validates :lastName, presence: true, length: { maximum: 25 }
    validates :phone, presence: true, length: { maximum: 10, minimum: 10 }





    


end
