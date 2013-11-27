module WikisHelper

  def has_collaborator(wiki, user)
    wiki.collaborators.map(&:user_id).include?(user.id)
  end

  def sortable(column, title = nil)  
    title ||= column.titleize  
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"  
    link_to title, :sort => column, :direction => direction  
  end  

end