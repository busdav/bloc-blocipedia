class Wiki < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged

  attr_accessible :body, :title, :public
  belongs_to :user
  validates :title, length: {minimum: 5, message: "your title is too short"}, presence: true
  validates :body, length: {minimum: 20}, presence: true
  validates :user, presence: true #do i need this here?  shouldn't a wiki always have a user if a requirement is current_user = true?
end