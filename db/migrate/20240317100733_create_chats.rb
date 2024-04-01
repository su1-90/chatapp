class CreateChats < ActiveRecord::Migration[7.1]
  def change
    create_table :chats do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :partner_id, null: false
      t.string :sentence, null: false

      t.timestamps
    end
  end
end
