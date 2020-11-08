class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :title, null: false
      t.integer :book_number, null: false, default: 1
      t.text :description, null: false, default: ""
      t.integer :price, null: false, default: 0
      t.string :amazon_url, null: false, default: ""
      t.string :amazon_image_url, null: false, default: ""
      t.references :book_series, foreign_key: true

      t.timestamps
    end
  end
end
