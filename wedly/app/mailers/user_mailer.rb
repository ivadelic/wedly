class UserMailer < ApplicationMailer
  default from: 'zee2198@hotmail.com'

  def welcome_email(user)
    @user = user
    @new_user_url = 'http://localhost:3000/users/new'
    mail(to: @user.email, subject: 'Welcome to WedWeb')
  end

  def partner_email(wedding)
    @wedding = wedding
    @new_user_url = 'http://localhost:3000/users/new'
    mail(to: @wedding.partner_email, subject: 'Invitation to Join WedWeb')
  end

  def invitation_email(invitation)
    @invitation = invitation
    @signup_url = signup_path(@invitation.token)
    mail(to: @invitation.recipient_email, subject: 'Wedding Invitation')
    invitation.update_attribute(:send_time, Time.now)
  end
end
