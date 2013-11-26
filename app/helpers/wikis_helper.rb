module WikisHelper

  def has_collaborator(wiki, user)
    wiki.collaborators.map(&:user_id).include?(user.id)
  end
end

