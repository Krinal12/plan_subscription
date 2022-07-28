class User < ApplicationRecord
  has_one :subscription
   has_one :plan, :through => :subscription
  
  enum role: {admin: 0, user: 1}
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
