class CreatePets < ActiveRecord::Migration
  def change
    create_table :pets do |t|
      t.string :name
      t.string :color
      t.string :breed

      t.timestamps
    end
  end
end
