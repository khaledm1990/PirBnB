class Listing < ActiveRecord::Base
mount_uploader :image, AvatarUploader
belongs_to :user
has_many :reservations

end
