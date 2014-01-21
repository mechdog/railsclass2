class Pet < ActiveRecord::Base
  validates :name, presence: true
end
