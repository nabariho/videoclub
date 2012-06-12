class Suscription < ActiveRecord::Base
  belongs_to :users
  belongs_to :groups

  attr_accessible :date, :group_id, :user_id
end
