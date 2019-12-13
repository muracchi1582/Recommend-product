class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string "title"
      t.string "movie"
      t.string "image"
      t.integer "price"
      t.integer "user_id"
      t.text   "information"
      t.timestamps
    end
  end
end
