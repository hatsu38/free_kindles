class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books, comment: "本" do |t|
      t.string :title, null: false, comment: "本のタイトル"
      t.integer :book_number, null: false, default: 1, comment: "何巻目の本か"
      t.text :description, null: false, default: "", comment: "本の説明"
      t.integer :price, null: false, default: 0, comment: "本の値段"
      t.string :amazon_url, null: false, default: "", comment: "参考のAmazonURL"
      t.string :amazon_image_url, null: false, default: "", comment: "参考のAmazonの画像URL"
      t.boolean :is_open, null: false, default: true, comment: "本を公開するか否か"
      t.references :book_series, foreign_key: true

      t.timestamps
    end
  end
end
