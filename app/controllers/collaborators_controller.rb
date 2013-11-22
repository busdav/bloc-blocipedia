class CollaboratorsController < ApplicationController

  def new
    @wiki = Wiki.find(params[:wiki_id])
    @collaborator = @wiki.collaborators.build(params[:collaborator])
  end

  def create
    @wiki = Wiki.find(params[:wiki_id])
    @collaborator = Collaborator.new(params[:id])
    @collaborator.wiki = @wiki

    if @collaborator.save
      flash[:notice] = "Collaborator[s] added"
      redirect_to [@wiki, @collaborator]
    else
      flash[:error] = "error creating collaborator"
      render :new
    end
  end

  def show
    @wiki = Wiki.find(params[:wiki_id])
    @collaborator = Collaborator.find(params[:id])
  end

  def edit
    @wiki = Wiki.find(params[:wiki_id])
    @collaborator = Collaborator.find(params[:id])
  end

  def update
    @wiki = Wiki.find(params[:wiki_id])
    @collaborator = Collaborator.find(params[:id])
  end

  def index
    @wiki = Wiki.find(params[:wiki_id])
    @collaborator = Collaborator.find(params[:id])
  end

end