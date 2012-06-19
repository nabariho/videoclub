class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.integer :n_cuenta
      t.datetime :fecha
      t.integer :secure_code

      t.timestamps
    end
  end
end
