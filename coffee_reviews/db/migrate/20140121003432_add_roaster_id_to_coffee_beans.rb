class AddRoasterIdToCoffeeBeans < ActiveRecord::Migration
  def change
    add_column :coffee_beans, :roaster_id, :integer
  end
end
