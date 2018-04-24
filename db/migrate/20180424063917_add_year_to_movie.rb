class AddYearToMovie < ActiveRecord::Migration[5.2]
  def change
    add_column :movies, :year, :integer
  end
end
