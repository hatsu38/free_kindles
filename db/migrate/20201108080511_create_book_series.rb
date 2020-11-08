class CreateBookSeries < ActiveRecord::Migration[6.0]
  def change
    # 同じTitleがある可能性を考慮してUniqueをDBではいれない
    create_table :book_series do |t|
      t.string :title, null: false
      t.integer :comics_count, null: false, default: 0
      t.text :description, null: false, default: ""
      t.string :amazon_url, null: false, default: ""

      t.timestamps
    end
  end
end
