class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by(phone: params[:session][:phone])
    if user==nil
      flash.now[:danger] = 'Invalid phone number'
      render 'new'
    else
       log_in user
      redirect_to user
    end


  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
