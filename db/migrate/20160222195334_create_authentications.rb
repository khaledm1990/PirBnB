class CreateAuthentications < ActiveRecord::Migration
  def change
    create_table :authentications do |t|
      t.string :uid
      t.string :token
      t.string :provider
      t.string :user_id
      t.timestamps null: false
    end
    add_index :authentications, :user_id
  end
end
