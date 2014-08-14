class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  
	devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
				 #:authentication_keys => [:email]
				 
	has_many :bets
	scope :topUsers, where(:points => !nil)
end
