class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.integer :user_id
      t.integer :listing_id
      t.string :reservation_owner
      t.string :reservation_ic
      t.date :start_date
      t.date :end_date
      t.timestamps null: false
    end

    add_index :reservations, :user_id
    add_index :reservations, :listing_id
  end
end
