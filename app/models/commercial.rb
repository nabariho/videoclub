class Commercial < ActiveRecord::Base
  attr_accessible :name, :file
  has_attached_file :file
  validates_presence_of :name
  validates_attachment_presence :file
  validates_uniqueness_of :name

end
