class UsersController < ApplicationController
helper_method :sort_column, :sort_direction

  def show
    @user = User.find(params[:id])
    @wikis = @user.wikis.reorder(sort_column + " " + sort_direction)
  end

  def index
    @user = User.find(params[:id])
  end

  private
  
  def sort_column
    Wiki.column_names.include?(params[:sort]) ? params[:sort] : "title"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

end