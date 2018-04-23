class CreateActorsAndMovie < ActiveRecord::Migration[5.2]
  def change
    create_table :actors_movies, id: false do |t|
      t.belongs_to :actors, index: true
      t.belongs_to :movies, index: true
    end
  end
end
