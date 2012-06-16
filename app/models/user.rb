class User < ActiveRecord::Base

  has_many :cards
  
  has_many :suscriptions
  has_many :groups, :through => :suscriptions

  before_create :asigna_grupo_defecto

  attr_accessor :login
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :authentication_keys => [:login]

  # Setup accessible (or protected) attributes for your model
  attr_accessible :username,:email, :password, :password_confirmation, :remember_me, :login
  # attr_accessible :title, :body


 def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      where(conditions).first
    end
  end
 def asigna_grupo_defecto
	self.groups << Group.find_by_name('base')
 end
end

