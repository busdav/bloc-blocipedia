class Collaborator < ActiveRecord::Base
  attr_accessible  :admin, :user_id
  belongs_to :user
  belongs_to :wiki
end