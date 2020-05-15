class Events < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :attended_event_id, :integer
  end
end
