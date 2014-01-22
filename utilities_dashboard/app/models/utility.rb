class Utility < ActiveRecord::Base
  belongs_to :user
  has_many :bills
  
  validates :name, presence: true

end
