class MessagesController < ApplicationController
  def create
    msg = Message.create(sender_id:session[:id], recipient_id:params[:recipient], message:params[:message])
    if msg.valid?
      msg.save
      redirect_to '/users/index'
    else
      flash[:message] = msg.errors.full_messages
      redirect_to '/users/index'
    end
  end
end
