class UserMailer < ActionMailer::Base
  default from: 'contacto@factoor.com'

  def welcome_email(user)
    @user = user
    mail(
      to: @user.email,
      subject: 'Bienvenido a Factoor'
      )
  end
end