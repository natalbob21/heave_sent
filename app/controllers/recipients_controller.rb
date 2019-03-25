class RecipientsController < ApplicationController
  before_action :find_event, only: [:show, :edit, :update, :destroy]

  def index 
    @recipients = current_user.recipients
    if @recipients.length.zero?
      flash[:alert] = 'You have no recipients. Create one now to get started.'
    end
  end
  
  def show
  end

  def new
    @recipient = Recipient.new
  end
  
  def create
    @recipient = Recipient.new(recipient_params)   
    @recipient.user = current_user
    if @recipient.save
      redirect_to @recipient, notice: "Successfully created new recipient"
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @recipient.update(recipient_params)
      redirect_to @recipient, notice: "Recipient was succestfully updated!"
    else
      render 'edit'
    end
  end

  def destroy
    @recipient.destroy
    redirect_to recipients_path
  end

  private

  def recipient_params
    params.require(:recipient).permit(:name, :phone)
  end

  def find_event
    @recipient = Recipient.find(params[:id])
  end



end
