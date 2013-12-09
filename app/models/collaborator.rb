class Collaborator < ActiveRecord::Base
  attr_accessible  :admin, :user, :wiki
  belongs_to :user
  belongs_to :wiki

  scope :includes_user, lambda {|user| where("user_id = ?", user.id)}
end