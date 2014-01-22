class CreateIngredients < ActiveRecord::Migration
  def change
    create_table :ingredients do |t|
      t.references :recipe, index: true
      t.string :name
      t.float :amount
      t.string :unit

      t.timestamps
    end
  end
end
