class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.integer :user_id
      t.integer :listing_id
      t.string :reservation_owner
      t.string :reservation_email
      t.string :reservation_ic
      t.string :reservation_card_number
      t.date :start_date
      t.string :end_date
      t.timestamps null: false
    end
  end
end
