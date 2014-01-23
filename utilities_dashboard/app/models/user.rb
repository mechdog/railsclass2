class User < ActiveRecord::Base

  has_many :utilities
  has_many :bills, through: :utilities
  has_many :utility_sharings

  has_many :sharings, class_name: 'UtilitySharing', inverse_of: :user
  has_many :shared_utilities, through: :sharings, source: :utility 
  

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
