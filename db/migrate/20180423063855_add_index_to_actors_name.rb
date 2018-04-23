class AddIndexToActorsName < ActiveRecord::Migration[5.2]
  def change
    add_index :actors, :name, unique: true
  end
end
