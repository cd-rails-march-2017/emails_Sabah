class UsersController < ApplicationController
  def index
    if !(session[:id])
      redirect_to '/'
    else
      @user = User.find(session[:id])
      @users = User.all
      #@outbox = Message.where(sender_id:session[:id])
      @outbox = @user.user_senders
      #@inbox = Message.where(recipient_id:session[:id])
      @inbox = @user.user_recipients
      @contacts = @user.user_senders + @user.user_recipients
    end

  end
end

#<% @contacts.map(&:recipient).uniq.each do |msg| %>
#<p>
#  <%=msg.name%>
#</p>
#<%end%>
