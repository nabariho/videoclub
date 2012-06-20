class Rent < ActiveRecord::Base
  belongs_to :user
  belongs_to :film

  attr_accessible :end_date, :film_id, :start_date, :user_id

  validates_presence_of :film_id, :start_date, :user_id
end
