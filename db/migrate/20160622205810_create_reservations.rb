class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.integer :number_of_guests
      t.datetime :reservation_time
      t.string :email
      t.belongs_to :restaurant, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
