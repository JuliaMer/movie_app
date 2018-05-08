class CreateShowtimes < ActiveRecord::Migration[5.2]
  def change
    create_table :showtimes do |t|
      t.references :movie
      t.string :cinema
      t.string :date

      t.timestamps
    end
  end
end
