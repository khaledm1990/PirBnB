class Listing < ActiveRecord::Base
mount_uploader :images, AvatarUploader
belongs_to :user

end
