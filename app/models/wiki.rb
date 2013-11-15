class Wiki < ActiveRecord::Base
  attr_accessible :body, :title, :public
  belongs_to :user
  validates :title, length: {minimum: 5}, presence: true
  validates :body, length: {minimum: 20}, presence: true
  validates :user, presence: true #do i need this here?  shouldn't a wiki always have a user if a requirement is current_user = true?
end
