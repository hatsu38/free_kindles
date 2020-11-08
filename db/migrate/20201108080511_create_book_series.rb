class CreateBookSeries < ActiveRecord::Migration[6.0]
  def change
    # 同じTitleがある可能性を考慮してUniqueをDBではいれない
    create_table :book_series, comment: "本のシリーズ" do |t|
      t.string :title, null: false, comment: "本のシリーズタイトル"
      t.integer :books_count, null: false, default: 1, comment: "本の巻数"
      t.text :description, null: false, default: "", comment: "本の説明"
      t.string :amazon_url, null: false, default: "", comment: "参考のAmazonURL"

      t.timestamps
    end
  end
end
