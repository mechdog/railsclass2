class AddConstraintOnOriginsCountry < ActiveRecord::Migration
  def change
    change_column :origins, :country, :string, limit: 3
  end
end
