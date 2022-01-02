class User < ApplicationRecord
  has_many :notes
  validates :provider, inclusion: ['github'], presence: true
  validates :uid, :name, :image_url, length: { maximum: 255 }, presence: true
  validates :image_url, length: { maximum: 255 }, format: { with: %r{\Ahttps://.*\z} }

  def self.find_or_create_from_auth_hash!(auth_hash)
    provider = auth_hash[:provider]
    uid = auth_hash[:uid]
    nickname = auth_hash[:info][:nickname]
    image_url = auth_hash[:info][:image]

    User.find_or_create_by!(provider: provider, uid: uid) do |user|
      user.name = nickname
      user.image_url = image_url
    end
  end
end
