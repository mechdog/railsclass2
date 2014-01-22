class CreateBills < ActiveRecord::Migration
  def change
    create_table :bills do |t|
      t.references :utility, index: true
      t.decimal :amount, scale: 2, precision: 8
      t.date :due_on

      t.timestamps
    end
  end
end
