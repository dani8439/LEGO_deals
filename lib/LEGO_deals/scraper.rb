class LEGODeals::Scraper
  def self.scrape_deals
    doc = Nokogiri::HTML(open("https://brickset.com/buy/country-us/vendor-amazon/order-percentdiscount/xml"))
    doc.css("table.neattable tbody tr").each do |row|
      name = row.css("div.highslide-caption h1").text.strip
      price = row.css("span.price a").text
      discount = row.css("td.disc").text
      original_price = row.css("span.originalprice a").text.gsub("RRP:", "")
      set_number = row.css("div.hideonmediumscreen.tags a:first").text
      year_released = row.css("div.hideonmediumscreen.tags a:last").text
      theme = row.css("div.hideonmediumscreen.tags a:nth-child(2)").text
      pieces = row.css("td.textcenter span.meta").text.gsub(/[()]/, "")
      url = row.css("h3 a").attribute("href").value
      LEGODeals::Deal.new(name, price, theme, set_number, year_released, discount, original_price, pieces, url)
    end
  end
end


# att_hash = {
# :name => row.css("div.highslide-caption h1").text.strip
# :price => row.css("span.price a").text
# :discount => row.css("td.disc").text
# :original_price => row.css("span.originalprice a").text.gsub("RRP:", "")
# :set_number => row.css("div.hideonmediumscreen.tags a:first").text
# :year_released => row.css("div.hideonmediumscreen.tags a:last").text
# :theme => row.css("div.hideonmediumscreen.tags a:nth-child(2)").text
# :pieces => row.css("td.textcenter span.meta").text.gsub(/[()]/, "")
# :url => row.css("h3 a").attribute("href").value}
# }

# LEGODeals::Deal.new(att_hash)
