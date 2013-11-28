class UsersController < ApplicationController
helper_method :sort_column, :sort_direction

  def show
    @user = User.find(params[:id])
    @wikis = @user.wikis
  end

  def index
    @user = User.find(params[:id])
  end

 

end