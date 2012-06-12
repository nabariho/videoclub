class CreateSuscriptions < ActiveRecord::Migration
  def change
    create_table :suscriptions do |t|
      t.integer :user_id
      t.integer :group_id
      t.datetime :date

      t.timestamps
    end
  end
end
