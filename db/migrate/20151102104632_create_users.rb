class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.text :picture
      t.text :tagline

      t.timestamps null: false
    end
  end
end
