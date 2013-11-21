class AddAdminToCollaborators < ActiveRecord::Migration
  def change
    add_column :collaborators, :admin, :integer
    add_index :collaborators, :admin
  end
end
