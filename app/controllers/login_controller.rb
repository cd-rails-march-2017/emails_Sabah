class LoginController < ApplicationController
  def index
    if session[:user]
      redirect_to '/users/index'
    end
  end

  def userlogin
    user = User.find_by(name:params[:name])
    if user == nil
      flash[:message] = ["user invalid"]
      redirect_to "/"
    elsif user.valid?
      if user.password == params[:password]
        session[:user] = user
        session[:id] = user.id
        redirect_to "/users/index"
      else
        flash[:message] = ["password invalid"]
        redirect_to "/"
      end
    end

  end

  def register
    user = User.create(name:params[:name], password:params[:password])
    if user.valid?
      user.save
      session[:user] = user
      session[:id] = user.id
      redirect_to "/users/index"
    else
      flash[:message] = user.errors.full_messages
      redirect_to "/"
    end
  end

  def logout
    reset_session
    redirect_to "/"
  end
end
