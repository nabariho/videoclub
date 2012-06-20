class Rent < ActiveRecord::Base
  belongs_to :user
  has_one     :film

  attr_accessible :end_date, :film_id, :start_date, :user_id

  validates_presence_of :film_id, :start_date, :user_id
end
