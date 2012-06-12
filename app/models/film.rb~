class Film < ActiveRecord::Base
  attr_accessible :buy_price, :rental_price, :sinopsis, :time, :title, :poster, :movie, :year
  has_attached_file :poster #, :styles => { :medium => "214x317>", :thumb => "107x159>" }
  has_attached_file :movie
  validates_presence_of :title
  validates_presence_of :rental_price
  validates_presence_of :buy_price
  validates_attachment_presence :poster
  validates_attachment_presence :movie
  validates_uniqueness_of :title
  validates :time, :numericality => { :only_integer => true, :greater_than => 0 }
  validates :year, :numericality => { :only_integer => true, :greater_than => 1800, :less_than => 2099 }
end
