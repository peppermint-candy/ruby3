class OrganizationsController < ApplicationController
  def create
    org = Organization.new(name:params[:name], description:params[:desc])

    creator = User.find(current_user.id)

    if org.valid?
      org.save

      last_org = Organization.last

      member = Member.new(user:creator, organization:last_org)
      if member.valid?
        member.save
        redirect_to '/groups'
      end
    else
      flash[:errors] = ['oop! Something went wrong, Please try again']
      redirect_to :back
    end
  end

  def show
    @me = User.find(current_user.id)
    @org = Organization.find(params[:id])
    @members = @org.members.drop(1)
  end

  def destroy
    org = Organization.find(params[:org])

    if org
      org.destroy
      redirect_to '/groups'
    else
      flash[:errors] = ['oops! Something went wrong, please try again']
      redirect_to :back
    end
  end
end
