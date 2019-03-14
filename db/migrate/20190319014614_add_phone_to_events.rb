class AddPhoneToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :phone, :string,  null: false
  end
end
