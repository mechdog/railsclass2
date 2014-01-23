class CreateUtilitySharings < ActiveRecord::Migration
  def change
    create_table :utility_sharings do |t|
      t.references :utility, index: true
      t.string :permission_level
      t.references :user

      t.timestamps
    end
  end
end
