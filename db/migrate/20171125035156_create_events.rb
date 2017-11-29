class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :title
      t.datetime :from, :to
      t.decimal :lat, :lng
      t.references :user, foreign_key: true


      t.timestamps
    end
  end
end
