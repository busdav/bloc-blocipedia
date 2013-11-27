class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :role
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  has_many :wikis
  has_many :collaborators, through: :wikis

  before_create :set_member

  ROLES = %w[free premium]
    def role?(base_role)
      role.nil? ? false : ROLES.index(base_role.to_s) <= ROLES.index(role)  
  end

  def set_member
    self.role = 'free'
  end

end
