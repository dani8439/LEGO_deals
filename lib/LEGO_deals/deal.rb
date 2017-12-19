class LEGODeals::Deal

  attr_accessor :name, :price, :theme, :set_number, :discount, :original_price, :pieces, :availability, :url
      # :availability, :url

  @@all = []

  def initialize(name = nil, price = nil, theme = nil, set_number = nil, discount = nil, original_price = nil, pieces = nil, availability = nil, url = nil)
    @name = name
    @price = price
    @theme = theme
    @set_number = set_number
    @discount = discount
    @original_price = original_price
    @pieces = pieces
    @availability = availability
    @url = url
    @@all << self
  end

  def self.all
    @@all
  end

  def self.today
    #Scrape Bricklink and then return deals based on that data
    self.scrape_deals
  end


  def self.scrape_deals
    deals = []
    @doc = Nokogiri::HTML(open("https://brickset.com/buy/country-us/vendor-amazon/order-percentdiscount/xml"))
    @doc.css("tbody").each do |row|
      deal = LEGODeals::Deal.new
      deal.name = row.css("h3 a").text
      deal.price = row.css("span.price a").text
      deal.discount = row.css("tbody tr td.disc").text
      deal.original_price = row.css("span.originalprice a").text.gsub("RRP:", "")
      deal.set_number = row.css("div.hideonmediumscreen.tags a:first").text
      # deal.theme = row.css("div.hideonmediumscreen.tags a:last").text
      deal.pieces = row.css("td.textcenter span.meta").text.gsub(/[()]/, "").split(",")
      deal.url = row.css("h3 a").attribute("href").value




      deals << deal
    end
    deals
  end

  #
  #   deals << self.scrape_bricklink
  # #   # Go to bricklink, find the product
  # #   # extract the properties
  # #   # instantiate a deal
  #


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
