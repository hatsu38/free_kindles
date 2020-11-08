# == Schema Information
#
# Table name: book_series
#
#  id                          :bigint           not null, primary key
#  title(本のシリーズタイトル) :string           not null
#  books_count(本の巻数)      :integer          default(1), not null
#  description(本の説明)       :text             default(""), not null
#  amazon_url(参考のAmazonURL) :string           default(""), not null
#  created_at                  :datetime         not null
#  updated_at                  :datetime         not null
#
class BookSeries < ApplicationRecord
  validates :title, uniqueness: { scope: :amazon_url }
  validates :amazon_url, presence: true
  validates :books_count, presence: true
  validates :description, presence: true
  validates :title, presence: true
end
