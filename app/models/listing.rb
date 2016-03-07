class Listing < ActiveRecord::Base
  searchkick autocomplete: [:country]
  mount_uploaders :images, AvatarUploader
  belongs_to :user
  has_many :reservations

end
