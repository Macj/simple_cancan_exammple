class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

   def admin?
   	role == 'admin'
   end

   def writer?
   	role == 'writer'
   end

   def staff?
   	role == 'staff'
   end
end
