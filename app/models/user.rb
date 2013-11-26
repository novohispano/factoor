class User < ActiveRecord::Base
  has_one  :company
  has_many :invoices

  def self.from_omniauth(auth, ip = "")
    user = find_with_auth(auth)
    user ? user : create_with_auth(auth, ip)
  end

  def self.find_with_auth(auth)
    User.where(
      provider: auth.provider,
      uid:      auth.uid
      ).first
  end

  def self.create_with_auth(auth, ip = "")
    User.new do |user|
      user.name             = auth.info.name
      user.email            = auth.info.email
      user.image            = auth.info.image
      user.location         = auth.info.location
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.oauth_token      = auth.credentials.token
      user.provider         = auth.provider
      user.uid              = auth.uid
      user.save!
    end
  end
end