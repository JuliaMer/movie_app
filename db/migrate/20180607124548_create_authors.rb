class CreateAuthors < ActiveRecord::Migration[5.2]
  def change
    create_table :authors do |t|
      t.integer :user_id
      t.integer :movie_id
      t.timestamps
    end
  end
end
