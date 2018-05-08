class ChangeColumnNameMovie < ActiveRecord::Migration[5.2]
  def change
    rename_column :movies, :url, :youtube_trailer_url
  end
end
