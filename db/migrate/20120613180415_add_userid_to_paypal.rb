class AddUseridToPaypal < ActiveRecord::Migration
  def change
    change_table(:paypals) do |t| 
       t.integer   :user_id
    end
  end
end
