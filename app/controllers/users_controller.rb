class UsersController < ApplicationController
  def index
  end

  def show
  end

  def destroy
  end

  def create
    user = User.new(first_name:params[:first_name], last_name:params[:last_name], email:params[:email], password:params[:password])

    if user.valid?
      user.save
      last_user = User.last
      session[:user_id] = last_user.id
      redirect_to '/groups'
    else
      flash[:errors] = [user.errors.full_messages]
      redirect_to :back
    end
  end
end
