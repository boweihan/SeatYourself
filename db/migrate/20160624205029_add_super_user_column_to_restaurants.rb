class AddSuperUserColumnToRestaurants < ActiveRecord::Migration
  def change
    add_column :restaurants, :superuser_id, :integer
  end
end
