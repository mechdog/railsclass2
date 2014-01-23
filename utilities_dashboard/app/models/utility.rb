class Utility < ActiveRecord::Base
  belongs_to :user
  has_many :bills
  has_many :utility_sharings, inverse_of: :utility

  validates :name, presence: true

end
