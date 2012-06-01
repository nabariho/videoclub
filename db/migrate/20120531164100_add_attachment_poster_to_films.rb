class AddAttachmentPosterToFilms < ActiveRecord::Migration
  def self.up
    add_column :films, :poster_file_name, :string
    add_column :films, :poster_content_type, :string
    add_column :films, :poster_file_size, :integer
    add_column :films, :poster_updated_at, :datetime
  end

  def self.down
    remove_column :films, :poster_file_name
    remove_column :films, :poster_content_type
    remove_column :films, :poster_file_size
    remove_column :films, :poster_updated_at
  end
end
