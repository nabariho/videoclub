class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.name :string

      t.timestamps
    end
  end
end
