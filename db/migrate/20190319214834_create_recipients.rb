class CreateRecipients < ActiveRecord::Migration[5.2]
  def change
    create_table :recipients do |t|
      t.belongs_to :user, index: true 
      t.string :name, null: false
      t.string :phone, null: false

      t.timestamps
    end
  end
end
