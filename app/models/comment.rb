class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :film

  attr_accessible :comentario
end
