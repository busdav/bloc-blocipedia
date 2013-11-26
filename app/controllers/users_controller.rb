class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @wikis = @user.wikis
    @wikis.sort_by_title
  end

  def index
    @user = User.find(params[:id])
  end

end