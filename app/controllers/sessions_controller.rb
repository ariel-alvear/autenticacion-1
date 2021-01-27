class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate([:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: 'Logeado correctamente'
    else
      flash.now[:notice] = 'Email o password inválida'
      render action: :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: 'Signed out successfully'
  end
end
