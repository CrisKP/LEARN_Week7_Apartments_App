class AdminController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize

  def index
    @users = User.all
  end

  def update
    user = User.find(params[:id])
    if user.has_role? :member
      user.roles = [] # user only has one role
      user.add_role(:admin)
      redirect_to '/admin'
    elsif user.has_role? :admin
      user.roles = [] # user only has one role
      user.add_role(:member)
      redirect_to '/admin'
    end
  end

  private

  def authorize
    if !current_user.has_role? :admin
      render plain:"No access for you!"
    end
  end
end
