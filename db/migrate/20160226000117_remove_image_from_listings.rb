class RemoveImageFromListings < ActiveRecord::Migration
  def change
    remove_column :listings, :image
  end
end
