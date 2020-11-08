# == Schema Information
#
# Table name: books
#
#  id               :bigint           not null, primary key
#  amazon_image_url :string           default(""), not null
#  amazon_url       :string           default(""), not null
#  book_number      :integer          default(1), not null
#  description      :text             default(""), not null
#  price            :integer          default(0), not null
#  title            :string           not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  book_series_id   :bigint
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
end
