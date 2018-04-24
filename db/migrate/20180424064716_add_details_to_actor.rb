class AddDetailsToActor < ActiveRecord::Migration[5.2]
  def change
    add_column :actors, :birthday, :date
  end
end
