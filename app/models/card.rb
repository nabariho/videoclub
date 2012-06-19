class Card < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :user_id
  validates_presence_of :fecha
  validates_presence_of :n_cuenta
  validates_presence_of :secure_code

  attr_accessible :fecha, :n_cuenta, :secure_code
end
