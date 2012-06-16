class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :comentario
      t.integer :film_id
      t.integer :user_id

      t.timestamps
    end
  end
end
