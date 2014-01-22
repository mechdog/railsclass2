class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name
      t.text :description
      t.integer :preparation_time
      t.integer :servings_yielded

      t.timestamps
    end
  end
end
