class CreateTastingNotes < ActiveRecord::Migration
  def change
    create_table :tasting_notes do |t|
      t.text :aroma
      t.text :mouthfeel
      t.text :acidity
      t.text :flavor
      t.text :finish
      t.integer :coffee_bean_id
      t.timestamps
    end
  end
end
