class Wiki < ActiveRecord::Base
  #extend FriendlyId
  #friendly_id :title, use: :slugged

  attr_accessible :body, :title, :public
  belongs_to :user
  validates :title, length: {minimum: 5, message: "your title is too short"}, presence: true
  validates :body, length: {minimum: 20}, presence: true
  validates :user, presence: true #do i need this here?  shouldn't a wiki always have a user if a requirement is current_user = true?

  scope :visible_to, lambda { |user| user.role == "premium" ? scoped : where(public: true) } #if user is premium, no filters, if not => filter by public == true
  scope :public, where(public: true) #make Wiki.public possible

  default_scope order('created_at DESC')

  has_many :collaborators
  has_many :users, :through => :collaborators
end