class RemoveRecipientsFromEvents < ActiveRecord::Migration[5.2]
  def change
    remove_column :events, :phone, :string
    remove_column :events, :recipient, :string
  end
end
