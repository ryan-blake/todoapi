class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :full_name
      t.string :password
      t.string :email
      t.string :login

      t.timestamps null: false
    end
  end
end
