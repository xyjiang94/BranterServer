class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password

      t.string :name
      t.boolean :gender
      t.date :birthday

      t.string :image_url

      t.timestamps
    end

    # add_index :email, unique: true
  end
end
