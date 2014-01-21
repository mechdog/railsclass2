class AddLastSeenAtToPets < ActiveRecord::Migration
  def change
    add_column :pets, :last_seen_at, :datetime
  end
end
