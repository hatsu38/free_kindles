# bundle exec rake batch:free_kindles_scrape
namespace :batch do
  desc "Kindle0円の本からスクレイピングして本のデータを作成する"
  task free_kindles_scrape: :environment do
    require 'open-uri'
    AMAZON_BASE_URL = 'https://www.amazon.co.jp'
    KINDLE_0YEN_BOOKS_URL = '/s?rh=n%3A2293143051%2Cp_36%3A-0'
    BOOK_DETAIL_URL_MATCH = /\/dp\/.+\?/
    MAX_PAGE = 400
    START_PAGE = 1
    CURRENT_TIME = Time.zone.now

    insert_book_serieses = []

    agent = Mechanize.new
    [*START_PAGE..MAX_PAGE].each do |page|
      page = agent.get(AMAZON_BASE_URL + KINDLE_0YEN_BOOKS_URL + "&page=#{page}")

      # Book Block
      blocks = page.search('div.sg-col-inner div.s-include-content-margin.s-border-bottom.s-latency-cf-section')

      blocks.each do |block|
        element = block.at('h2.s-line-clamp-2 a')

        title = element.text.strip
        link = generate_amazon_url(element)
        price = block.at('span.a-price span.a-price-whole').text.match(/\w.+/).to_s.to_i
        image_url = block.at('img').get_attribute(:src)
        book_series = block.at('div.a-color-secondary a')
        book_number = generate_book_number(book_series)

        book_series_amazon_url = generate_amazon_url(book_series)
        book_series_title = generate_book_series_title(book_series)
        book_series_amazon_url = generate_amazon_url(book_series)
        series_books_count = generate_books_count(book_series)

        book_series_object = BookSeries.new(title: book_series_title, description: "", books_count: series_books_count, amazon_url: book_series_amazon_url)
        book_series_object.books.build(title: title, description: "", book_number: book_number, price: price, amazon_url: link, amazon_image_url: image_url)
        insert_book_serieses << book_series_object
      end
    end
    BookSeries.import insert_book_serieses, recursive: true, validate: true
  end
end

def generate_amazon_url(element)
  url = element.get_attribute(:href).match(BOOK_DETAIL_URL_MATCH).to_s.chop
  AMAZON_BASE_URL + url
end

def generate_book_series_title(element)
  element.text.strip.match(/「.+」/).to_s[1..-2]
end

def generate_except_title(element)
  element.text.strip.match(/「.+」/)&.post_match
end

def generate_books_count(element)
  except_title = generate_except_title(element)
  return nil if except_title.nil?

  except_title.match(/全\w+/).to_s[1..-1].to_s.to_i
end

def generate_book_number(element)
  except_title = generate_except_title(element)
  return nil if except_title.nil?

  except_title.match(/の\w+/).to_s[1..-1].to_s.to_i
end