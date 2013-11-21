class WikisController < ApplicationController
  def index
    @wikis = current_user.nil? ? Wiki.public : Wiki.visible_to(current_user)
  end

  def new
    @wiki = Wiki.new
    authorize! :create, @wiki, message: "You must be authorized to make a new wiki"
  end

  def show
    @wiki = Wiki.find(params[:id])
    authorize! :read, @wiki, message: "You must be authorised in to view Wikis"
  end

  def edit
    @wiki = Wiki.find(params[:id])
    authorize! :update, @wiki, message: "You must be logged in to edit Wikis"
  end

  def create
    @wiki = current_user.wikis.build(params[:wiki])
    authorize! :create, @wiki, message: "   "
    if @wiki.save
      flash[:notice] = "Wiki Saved Successfully!"
      redirect_to @wiki
    else
      Rails.logger.info @wiki.errors.full_messages
      flash[:error] = "Error saving wiki :("
      render :new
    end
  end

  def update
    @wiki = Wiki.find(params[:id])
    authorize! :update, @wiki, message: "You must be logged in to edit Wikis"
    if @wiki.update_attributes(params[:wiki])
      flash[:notice] = "updated successfully!"
      redirect_to @wiki
    else 
      flash[:error] = "You must be logged in to update!"
      render :edit
    end
  end

  def destroy
    @wiki = Wiki.find(params[:id])
    authorize! :destroy, @wiki, message: "You must be logged in to delete this"
    if @wiki.destroy
      flash[:notice] = "destroyed successfully"
      redirect_to wiki_path
    else
      flash[:error] = "wrong"
      render :show
    end
  end
end