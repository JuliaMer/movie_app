class AddDetailsToMovie < ActiveRecord::Migration[5.2]
  def change
    add_column :movies, :genre, :string
    add_column :movies, :url, :string
  end
end
