class WikisController < ApplicationController
  def index
    @wiki = Wiki.all
  end

  def new
    @wiki = Wiki.new
    authorize! :create, @wiki, message: "Error message for create"
  end

  def show
    @wiki = Wiki.find(params[:id])
    authorize! :read, @wiki, message: "Error message for show"
  end

  def edit
    @wiki = Wiki.find(params[:id])
    authorize! :update, @wiki, message: "Error message for update"
  end

  def create
    @wiki = Wiki.new(params[:wiki])
    authorize! :create, @wiki, message: "Error message for create"
    if @wiki.save
      flash[:notice] = "Wiki Saved Successfully!"
      redirect_to @wiki
    else
      flash[:error] = "wiki not saved :("
      render :new
    end
  end

  def update
    @wiki = Wiki.find(params[:id])
    authorize! :update, @wiki, message: "Error message for update"
    if @wiki.update_attributes(params[:wiki])
      flash[:notice] = "updated!"
      redirect_to @wiki
    else 
      flash[:error] = "error updating!"
      render :edit
    end
  end

  def destroy
    @wiki = Wiki.find(params[:id])
    authorize! :destroy, @wiki, message: "Error message for delete"
    if @wiki.destroy
      flash[:notice] = "destroyed successfully"
      redirect_to wiki_path
    else
      flash[:error] = "wrong"
      render :show
    end
  end
end