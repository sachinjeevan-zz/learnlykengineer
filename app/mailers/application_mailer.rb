class ApplicationMailer < ActionMailer::Base
  default from: 'sachinjeevan2506@gmail.com'
  layout 'mailer'
  def registration_confirmation(user)
    @user = user
    mail(:to => "#{user.name} <#{user.email}>", :subject => "Registration Confirmation")
 end
end
