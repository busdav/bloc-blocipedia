class WikisController < ApplicationController
  respond_to :html, :js

  def index
    @wikis = current_user.nil? ? Wiki.public.order('created_at desc') : (Wiki.public.to_a + current_user.collaborations + current_user.wikis)
  end

  def new
    @wiki = Wiki.new
    authorize! :create, @wiki, message: "You must be authorized to make a new wiki"
  end

  def show
    @wiki = Wiki.find(params[:id])
    if request.path != wiki_path(@wiki)             #friendly_id gem
      redirect_to @wiki, status: :moved_permanently #friendly_id gem
    end                                             #friendly_id gem
    authorize! :read, @wiki, message: "You must be authorized to view Wikis"
  end

  def edit
    @wiki = Wiki.find(params[:id])
    authorize! :update, @wiki, message: "You must be authorized to edit Wikis"
  end

  def create
    @wiki = Wiki.new(params[:wiki])
    @wiki.user = current_user
    authorize! :create, @wiki
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
    authorize! :update, @wiki, message: "You must be authorized to edit Wikis"
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
    authorize! :destroy, @wiki, message: "You must be authorized to delete this"
    if @wiki.destroy
 #     flash[:notice] = "destroyed successfully"
    else
      flash[:error] = "unable to delete!"
    end
    
    respond_with(@wiki) do |f|
      f.html { redirect_to user_path(current_user) }
    end
  end

  def manage_collaborators
    @wiki = Wiki.find(params[:id])
    @users = (current_user.blank? ? User.all : User.find(:all, :conditions => ["id != ?", current_user.id]))
  end

  def save_collaborators
    @wiki = Wiki.find(params[:id])
    success = false
    current_collaborators = @wiki.collaborators.map(&:id)
    Rails.logger.info ">>>> #{current_collaborators.inspect}"
    
    if params["collaborator_id"].nil?
      current_collaborators.each do |collab_id| 
        Collaborator.destroy(collab_id)
        success = true
      end
    else
      params["collaborator_id"].each do |collaborator_id|
      user = User.find(collaborator_id)
      success = Collaborator.create(user: user, wiki: @wiki)
      end
    end
    Rails.logger.info "<<<< #{current_collaborators.inspect}"
    if success && params["collaborator_id"]
      current_collaborators.each do |collab_id| 
        Collaborator.destroy(collab_id)
      end
      Rails.logger.info "<<<< #{@wiki.collaborators.map(&:id)}"
      flash[:notice] = "successfully saved collaborators!"
      redirect_to @wiki
    elsif success && params["collaborator_id"].nil?
      flash[:notice] = "removed all collaborators!"
      redirect_to @wiki
      
    else
      flash[:error] = "unable to save collaborators"
      redirect_to @wiki
    end
  end
end