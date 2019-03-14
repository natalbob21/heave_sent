class AddRecipientToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :recipient, :string,  null: false
  end
end
