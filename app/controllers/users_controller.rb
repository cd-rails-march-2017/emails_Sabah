class UsersController < ApplicationController
  def index
    if !(session[:id])
      redirect_to '/'
    else
      @user = User.find(session[:id])
      @users = User.all

      @inbox = Message.where(recipient_id:session[:id])
      @inbox = @user.user_senders       #same as above

      @outbox = Message.where(sender_id:session[:id])
      @outbox = @user.user_recipients   #same as above

      @contacts = (@user.senders + @user.recipients).uniq
    end
  end
end
