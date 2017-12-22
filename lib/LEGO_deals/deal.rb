class LEGODeals::Deal

  attr_accessor :name, :price, :theme, :set_number, :year_released, :discount, :original_price, :pieces, :availability, :url, :vendor
      # :availability, :url

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

  # def self.scrape_deals
    # Go to bricklink, find the product
    # extract the properties
    # instantiate a deal
  #   deals = []
  #   deals << self.scrape_bricklink
  #   deals
  # end




  # def self.scrape_bricklink
  #   doc = Nokogiri::HTML(open("https://brickset.com/buy/country-us/xml/vendor-Amazon"))  #{vendor}
  #   name = doc.search("h3 a").text,
  #   price = doc.search("span.price a").text
  #   discount = doc.search("td.disc").text
  #   # pieces = doc.search("span.meta").text
  #   # availability = doc.search("span.meta.block").text
  #   # url = doc.search("h3 a").first.attr("href")
  # end



end

# deal_1 = self.new
# deal_1.name = "Harley Quinn to the Rescue"
# deal_1.price = "$15.69"
# deal_1.discount = "48%"
# deal_1.availability = true
# deal_1.pieces = "217 pieces, 0.072 pp"
# deal_1.url = "https://www.amazon.com/gp/product/B01F4710HU/ref=as_li_ss_tl?ie=UTF8&tag=bargainwatchusa-20&linkCode=as2&camp=217145&creative=399373&creativeASIN=B01F4710HU"
#
# deal_2 = self.new
# deal_2.name = "Super Hero High School"
# deal_2.price = "$44.79"
# deal_2.discount = "44%"
# deal_2.availability = true
# deal_2.pieces = "712 pcs, 0.063 pp"
# deal_2.url = "https://www.amazon.com/gp/product/B01F4710ES/ref=as_li_ss_tl?ie=UTF8&tag=bargainwatchusa-20&linkCode=as2&camp=217145&creative=399373&creativeASIN=B01F4710ES"
#
# deal_3 = self.new
# deal_3.name = "Sergeant Jyn Erso"
# deal_3.price = "$13.94"
# deal_3.discount = "44%"
# deal_3.availability = true
# deal_3.pieces = "104 pcs, 0.134 pp"
# deal_3.url = "https://www.amazon.com/gp/product/B01CVGV928/ref=as_li_ss_tl?ie=UTF8&tag=bargainwatchusa-20&linkCode=as2&camp=217145&creative=399373&creativeASIN=B01CVGV928"
#
# deal_4 = self.new
# deal_4.name = "K-2SO"
# deal_4.price = "$14.57"
# deal_4.discount = "42%"
# deal_4.availability = true
# deal_4.pieces = "169 pcs, 0.086 pp"
# deal_4.url = "https://www.amazon.com/gp/product/B01CVGV914/ref=as_li_ss_tl?ie=UTF8&tag=bargainwatchusa-20&linkCode=as2&camp=217145&creative=399373&creativeASIN=B01CVGV914"
#
# deal_5 = self.new
# deal_5.name = "Chirrut Îmwe"
# deal_5.price = "$14.38"
# deal_5.discount = "42%"
# deal_5.availability = true
# deal_5.pieces = "87 pcs, 0.165 pp"
# deal_5.url = "https://www.amazon.com/gp/product/B01MXEMXGK/ref=as_li_ss_tl?ie=UTF8&tag=bargainwatchusa-20&linkCode=as2&camp=217145&creative=399373&creativeASIN=B01MXEMXGK"
