class AddTimestampsToRoasters < ActiveRecord::Migration
  def change
    add_column :roasters, :created_at, :datetime
    add_column :roasters, :updated_at, :datetime 
  end
end
