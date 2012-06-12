class AddAttachmentMovieToFilms < ActiveRecord::Migration
  def self.up
    add_column :films, :movie_file_name, :string
    add_column :films, :movie_content_type, :string
    add_column :films, :movie_file_size, :integer
    add_column :films, :movie_updated_at, :datetime
  end

  def self.down
    remove_column :films, :movie_file_name
    remove_column :films, :movie_content_type
    remove_column :films, :movie_file_size
    remove_column :films, :movie_updated_at
  end
end
