class RenameActorMovieToRole < ActiveRecord::Migration[5.2]
  def change
    rename_table :actor_movies, :roles
  end
end
