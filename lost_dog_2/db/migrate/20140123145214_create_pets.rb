class CreatePets < ActiveRecord::Migration
  def change
    create_table :pets do |t|
      t.string :name
      t.datetime :last_seen_at

      t.timestamps
    end
  end
end
