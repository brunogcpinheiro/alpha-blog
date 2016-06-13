class SessionsController < ApplicationController
  
  def new
    
  end
  
  #login (create state)
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] =  user.id
      flash[:success] = "Great! You have logged in Alpha Blog!"
      redirect_to user_path(user)
    else
      flash.now[:danger] = "Email or password invalid"
      render 'new'
    end
  end
  
  #logout (destroy state)
  def destroy
    session[:user_id] = nil
    flash[:success] = "You have logged out!"
    redirect_to root_path
  end
  
end