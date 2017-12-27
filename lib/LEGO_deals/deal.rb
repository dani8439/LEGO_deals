class LEGODeals::Deal

  attr_accessor :name, :price, :theme, :set_number, :year_released, :discount, :original_price, :pieces, :availability, :url

  @@all = []

  def initialize(name, price, theme, set_number, year_released, discount, original_price, pieces, url )
    @name = name
    @price = price
    @theme = theme
    @set_number = set_number
    @year_released = year_released
    @discount = discount
    @original_price = original_price
    @pieces = pieces
    @url = url
    @@all << self
  end

  def self.all
    @@all.uniq[0..19]
  end

end

# metaprogramming 
# def initialize(hash) #name => row.css("div.highslide-caption h1").text.strip
#   self.send(name, Rey)
#   @@all << self
# end
