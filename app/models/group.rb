class Group < ActiveRecord::Base

  has_many :suscriptions
  has_many :users, :through => :suscriptions

  attr_accessible :description, :name, :date
end
