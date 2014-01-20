class CreateCoffeeBeans < ActiveRecord::Migration
  def change
    create_table :coffee_beans do |t|
      t.string :name
      t.datetime :roasted_on
      t.timestamps
    end
  end
end
