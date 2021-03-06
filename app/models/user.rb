class User < ActiveRecord::Base
  mount_uploader :image, AvatarUploader
  include Clearance::User
  has_many :listings, dependent: :destroy
  has_many :authentications, :dependent => :destroy
  has_many :reservations , :dependent => :destroy

  def self.create_with_auth_and_hash(authentication,auth_hash)
    create! do |u|
      u.first_name = auth_hash["info"]["name"]
      u.email = auth_hash["extra"]["raw_info"]["email"]
      u.encrypted_password = [*('A'..'Z')].sample(8).join
      u.authentications<<(authentication)
    end
  end

end
