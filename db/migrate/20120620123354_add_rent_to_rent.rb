class AddRentToRent < ActiveRecord::Migration
  def change
    change_table(:rents) do |t|
       t.boolean :rent
    end

  end
end
