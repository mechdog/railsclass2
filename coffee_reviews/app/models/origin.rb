class Origin < ActiveRecord::Base
  has_many :coffee_beans
  has_many :roasters, through: :coffee_beans
end
