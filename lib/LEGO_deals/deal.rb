class LEGODeals::Deal

  attr_accessor :name, :price, :theme, :set_number, :year_released, :discount, :original_price, :pieces, :availability, :url
  # :vendor ?

  @@all = []

  def initialize
    @@all << self
  end

  def self.all
    @@all.uniq[0..14]
  end

  def self.today
    self.scrape_deals
  end


  def self.scrape_deals
    @doc = Nokogiri::HTML(open("https://brickset.com/buy/country-us/vendor-amazon/order-percentdiscount/xml"))
    @doc.css("table.neattable tbody tr").each do |row|
      deal = LEGODeals::Deal.new
      deal.name = row.css("div.highslide-caption h1").text.strip
      deal.price = row.css("span.price a").text
      deal.discount = row.css("td.disc").text
      deal.original_price = row.css("span.originalprice a").text.gsub("RRP:", "")
      deal.set_number = row.css("div.hideonmediumscreen.tags a:first").text
      deal.year_released = row.css("div.hideonmediumscreen.tags a:last").text
      # deal.theme = row.css("div.hideonmediumscreen.tags a:second").text
      deal.pieces = row.css("td.textcenter span.meta").text.gsub(/[()]/, "")
      deal.url = row.css("h3 a").attribute("href").value
      # deal.vendor = row.css("td.vendor a img[alt='Amazon']").text

      @@all << deal
    end
    @@all
  end
end




  # def self.scrape_bricklink
  #   doc = Nokogiri::HTML(open("https://brickset.com/buy/country-us/xml/vendor-Amazon"))  #{vendor}
  #   name = doc.search("h3 a").text,
  #   price = doc.search("span.price a").text
  #   discount = doc.search("td.disc").text
  #   # pieces = doc.search("span.meta").text
  #   # availability = doc.search("span.meta.block").text
  #   # url = doc.search("h3 a").first.attr("href")
  # end
