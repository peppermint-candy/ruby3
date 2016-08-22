class SessionsController < ApplicationController
  def main
  end

  def index
    @user = User.find(current_user.id)
    @orgs = Organization.all
  end

  def create
    user = User.find_by_email(params[:email])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to '/groups'
    else
      flash[:errors] = ["Invalid combination"]
      redirect_to :back
    end
  end

  def destroy
    reset_session
    redirect_to '/main'
  end
end
