# == Schema Information
#
# Table name: book_series
#
#  id           :bigint           not null, primary key
#  amazon_url   :string           default(""), not null
#  comics_count :integer          default(0), not null
#  description  :text             default(""), not null
#  title        :string           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class BookSeries < ApplicationRecord
end
