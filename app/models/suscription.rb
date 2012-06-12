class Suscription < ActiveRecord::Base
  belongs_to :user
  belongs_to :group

  attr_accessible :date, :group_id, :user_id
end
