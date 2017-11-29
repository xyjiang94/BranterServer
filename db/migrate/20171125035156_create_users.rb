class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.boolean :gender
      t.date :birthday

      t.timestamps
    end
  end
end
