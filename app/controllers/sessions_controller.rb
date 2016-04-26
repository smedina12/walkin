class SessionsController < ApplicationController
  def new
  end
  
  
  def create
   
 user = User.find_by(phone: params[:session][:phone])
        if user==nil
          redirect_to signin_path, notice: 'Please use a valid Phone Number' 
    else
       log_in user
      redirect_to signincustomer_path
 
        end
  end
  
  def show
    if logged_in? == true
      user.show
    end
  end

  def destroy
    log_out 
    redirect_to root_url
  end
end
