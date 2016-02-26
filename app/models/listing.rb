class Listing < ActiveRecord::Base
mount_uploaders :images, AvatarUploader
belongs_to :user

end
