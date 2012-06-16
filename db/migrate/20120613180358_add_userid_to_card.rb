class AddUseridToCard < ActiveRecord::Migration
  def change
    change_table(:cards) do |t| 
       t.integer   :user_id
    end
  end
end
