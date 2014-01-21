class AddNotNullConstraintToCoffeeBeansName < ActiveRecord::Migration
  def change
    change_column :coffee_beans, :name, :string, null: false
  end
end
