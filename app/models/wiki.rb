class Wiki < ActiveRecord::Base
  attr_accessible :body, :title, :public
  belongs_to :user
end
