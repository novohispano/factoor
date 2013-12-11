class EmailerJob
  @queue = :email

  def self.perform(user)
    UserMailer.welcome_email(user).deliver
  end
end