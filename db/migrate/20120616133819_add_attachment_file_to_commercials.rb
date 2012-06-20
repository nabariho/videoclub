class AddAttachmentFileToCommercials < ActiveRecord::Migration
  def self.up
    add_column :commercials, :file_file_name, :string
    add_column :commercials, :file_content_type, :string
    add_column :commercials, :file_file_size, :integer
    add_column :commercials, :file_updated_at, :datetime
  end

  def self.down
    remove_column :commercials, :file_file_name
    remove_column :commercials, :file_content_type
    remove_column :commercials, :file_file_size
    remove_column :commercials, :file_updated_at
  end
end
