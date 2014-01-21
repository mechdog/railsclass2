# app/models/coffee_bean.rb 
class CoffeeBean < ActiveRecord::Base
  belongs_to :roaster
  belongs_to :origin
  has_one :tasting_note
end
