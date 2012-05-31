class Delete < ActiveRecord::Migration
  def up
  end

  def down
	remove_column :users, :confirmation_token, :confirmed_at, :confirmation_sent_at, :unconfirmed_email
  end
end
