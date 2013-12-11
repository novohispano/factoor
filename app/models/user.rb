class User < ActiveRecord::Base
  has_one  :company
  has_many :invoices

  def self.from_omniauth(auth)
    find_with_auth(auth) || create_with_auth(auth)
  end

  def self.find_with_auth(auth)
    User.find_by(
      provider: auth.provider,
      uid:      auth.uid
      )
  end

  def self.create_with_auth(auth)
    user = User.new do |user|
      user.name             = auth.info.name
      user.email            = auth.info.email
      user.image            = auth.info.image
      user.location         = auth.info.location
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.oauth_token      = auth.credentials.token
      user.provider         = auth.provider
      user.uid              = auth.uid
    end

    send_welcome_email(user)

    user
  end

  def self.send_welcome_email(user)
    Resque.enqueue(EmailerJob, user) if user.save! && user.email
  end
end