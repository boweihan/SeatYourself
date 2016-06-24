class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.integer :max_occupancy
      t.string :address
      t.string :website
      t.string :cuisine

      t.timestamps null: false
    end
  end
end
