class AddUuidToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :uuid, :uuid, null: false
  end
end
