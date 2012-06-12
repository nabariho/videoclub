class YearFilm < ActiveRecord::Migration
  def up
	add_column :films, :year, :integer
  end

  def down
	remove_column :films, :year
  end
end
