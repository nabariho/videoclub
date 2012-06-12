class CreateFilms < ActiveRecord::Migration
  def change
    create_table :films do |t|
      t.string :title
      t.integer :time
      t.float :rental_price
      t.float :buy_price
      t.text :sinopsis

      t.timestamps
    end
  end
end
