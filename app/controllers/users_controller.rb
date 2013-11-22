class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
  end

  def index
    @user = User.find(params[:id])
  end

end