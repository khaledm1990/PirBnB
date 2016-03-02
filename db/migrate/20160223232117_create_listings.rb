class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.integer :user_id
      t.string :title
      t.text :about
      t.string :property_type
      t.string :room_type
      t.string :acommodates
      t.integer :bedrooms
      t.integer :beds
      t.integer :bathrooms
      t.string :country
      t.string :address
      t.string :city
      t.string :state
      t.string :zip_code
      t.timestamps null: false
    end
  end
end
