class InvitationsController < ApplicationController
  before_filter :load_wedding

  def index
    @invitations = Invitation.all
  end

  def new
    @invitation = Invitation.new
  end

  def create
    @invitation = Invitation.new(invitation_params)
    # @invitation = @wedding.invitations.build(invitation_params)
    @invitation.wedding = @wedding
    @invitation.token = @wedding.token
    if @invitation.save
      UserMailer.invitation_email(@invitation).deliver_later
      flash[:notice] = "Invitation sent."
    else
      flash[:notice] = "Invitation could not be sent."
    end
    redirect_to wedding_invitations_path(@invitation.wedding)
  end

  private
  def invitation_params
    params.require(:invitation).permit(
      :recipient_email,
      :token,
      :wedding_id,
      :send_time
      )
  end

  def load_wedding
    @wedding = Wedding.find(params[:wedding_id])
  end
end
