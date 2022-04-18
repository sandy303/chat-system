class CreateConversations < ActiveRecord::Migration[7.0]
  def change
    create_table :conversations do |t|
      t.integer :messages_count
      t.integer :sender_id
      t.integer :reciepient_id 
      t.string :name

      t.timestamps
    end
  end
end
 