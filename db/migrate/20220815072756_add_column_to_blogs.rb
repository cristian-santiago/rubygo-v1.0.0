class AddColumnToBlogs < ActiveRecord::Migration[7.0]
  def change
    add_column :blogs, :description, :text
  end
end
