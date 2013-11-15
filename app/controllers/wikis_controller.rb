class WikisController < ApplicationController
  def index
    @wiki = Wiki.all
  end

  def new
    @wiki = Wiki.new
  end

  def show
    @wiki = Wiki.find(params[:id])
  end

  def edit
    @wiki = Wiki.find(params[:id])
  end

  def create
    @wiki = Wiki.new(params[:wiki])
    if @wiki.save
      flash[:notice] = "Wiki Saved Successfully!"
      redirect_to @wiki
    else
      flash[:error] = "wiki not saved :("
    end
  end

  def update
    @wiki = Wiki.find(params[:id])
    
    if @wiki.update_attributes(params[:wiki])
      flash[:notice] = "updated!"
      redirect_to @wiki
    else 
      flash[:error] = "error updating!"
      redirect_to :edit
    end
  end

  def destroy
    @wiki = Wiki.find(params[:id])
    if @wiki.destroy
      flash[:notice] = "destroyed successfully"
      redirect_to wiki_path
    else
      flash[:error] = "wrong"
      render :show
    end
  end
end