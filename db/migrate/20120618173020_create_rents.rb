class CreateRents < ActiveRecord::Migration
  def change
    create_table :rents do |t|
      t.integer :user_id
      t.integer :film_id
      t.datetime :start_date
      t.datetime :end_date

      t.timestamps
    end
  end
end
