# == Schema Information
#
# Table name: books
#
#  id                                      :bigint           not null, primary key
#  title(本のタイトル)                     :string           not null
#  book_number(何巻目の本か)               :integer          default(1), not null
#  description(本の説明)                   :text             default(""), not null
#  price(本の値段)                         :integer          default(0), not null
#  amazon_url(参考のAmazonURL)             :string           default(""), not null
#  amazon_image_url(参考のAmazonの画像URL) :string           default(""), not null
#  is_open(本を公開するか否か)            :boolean           default(true), not null
#  book_series_id                          :bigint
#  created_at                              :datetime         not null
#  updated_at                              :datetime         not null
#
# Indexes
#
#  index_books_on_book_series_id  (book_series_id)
#
# Foreign Keys
#
#  fk_rails_...  (book_series_id => book_series.id)
#
class Book < ApplicationRecord

  belongs_to :book_series

  validates :title, presence: true
  validates :amazon_url, presence: true
  validates :book_number, presence: true
  validates :price, presence: true
end
