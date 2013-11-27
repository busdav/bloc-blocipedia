class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @wikis = @user.wikis
    @wikis.sort! { |a, b| a.title <=> b.title }
  end

  def index
    @user = User.find(params[:id])
  end

end