class AddLikesToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :likes, :integer, default: 0
  end
end
