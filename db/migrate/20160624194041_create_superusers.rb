class CreateSuperusers < ActiveRecord::Migration
  def change
    create_table :superusers do |t|
      t.string :name
      t.string :phone
      t.string :email
      t.string :password_digest

      t.timestamps null: false
    end
  end
end
