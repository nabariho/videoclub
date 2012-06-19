class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :film

  #before_create :asigna_user_film
  attr_accessible :comentario

  validates_presence_of :comentario, :user_id, :film_id

   def asigna_user_film
     self.user = current_user
     #self.film_id = @film.id
   end
end
