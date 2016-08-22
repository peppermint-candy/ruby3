class MembersController < ApplicationController
  def create
    member = Member.where(user:User.find(current_user.id), organization:Organization.find(params[:org]))

    if member.any?
      flash[:errors] = ['oops! Something went wrong, please try again']
      redirect_to :back
    else
      n_member = Member.new(user:User.find(current_user.id), organization:Organization.find(params[:org]))
      if n_member.valid?
        n_member.save
        redirect_to '/groups'
      end
    end
  end

  def destroy
    member = Member.where(user:User.find(current_user.id), organization:Organization.find(params[:org]))

    if member.any?
      member.first.destroy
      redirect_to '/groups'
    else
      flash[:errors] = ['oops! Something went wrong, please try again']
      redirect_to :back
    end
  end
end
