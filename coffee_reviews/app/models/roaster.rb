# app/models/roaster.rb 
class Roaster < ActiveRecord::Base
  has_many :coffee_beans
  has_many :origins, through: :coffee_beans

end