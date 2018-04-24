class AddDetailsToRole < ActiveRecord::Migration[5.2]
  def change
    add_column :roles, :character, :string
  end
end
