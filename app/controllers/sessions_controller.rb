class SessionsController < ApplicationController

  def new
  end

  def create
    s_params = params[:session]
    user = User.find_by(email: s_params[:email].downcase)
    if user && user.authenticate(s_params[:password])
      sign_in user
      redirect_to user
    else
      flash.now[:error] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_url
  end

end
