class UserMailer < ApplicationMailer
  default from: 'zee2198@hotmail.com'

  def welcome_email(user)
    @user = user
    @url = 'http://localhost:3000/users/new'
    mail(to: @user.email, subject: 'Welcome to WedWeb')
  end

  def partner_email(wedding)
    @wedding = wedding
    @url = 'http://localhost:3000/weddings/new'
    mail(to: @wedding.partner_email, subject: 'Invitation to Join WedWeb')
  end
end
