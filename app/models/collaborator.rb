class Collaborator < ActiveRecord::Base
  attr_accessible  :admin, :user, :wiki
  belongs_to :user
  belongs_to :wiki
end