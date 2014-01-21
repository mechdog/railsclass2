class CreateOrigins < ActiveRecord::Migration
  def change
    create_table :origins do |t|
      t.string :name
      t.string :country
      t.integer :elevation
      t.timestamps
    end

    add_column :coffee_beans, :origin_id, :integer

  end
end
