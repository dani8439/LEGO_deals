class LEGODeals::Deal

  attr_accessor :name, :price, :discount, :availability, :url

  def self.today
    puts "1. Harley Quinn to the Rescue - $15.69 - 48% Discount"
    puts "2. Super Hero High School - $44.79 - 44% Discount"
    puts "3. Sergeant Jyn Erso - $13.94 - 44% Discount"
    deal_1 = self.new
    deal_1.name = "Harley Quinn to the Rescue"
    deal_1.price = "$15.69"
    deal_1.discount = "48%"
    deal_1.availability = true
    deal_1.url = "https://www.amazon.com/gp/product/B01F4710HU/ref=as_li_ss_tl?ie=UTF8&tag=bargainwatchusa-20&linkCode=as2&camp=217145&creative=399373&creativeASIN=B01F4710HU"

    deal_2 = self.new
    deal_2.name = "Super Hero High School"
    deal_2.price = "44.79"
    deal_2.discount = "44%"
    deal_2.availability = true
    deal_2.url = "https://www.amazon.com/gp/product/B01F4710ES/ref=as_li_ss_tl?ie=UTF8&tag=bargainwatchusa-20&linkCode=as2&camp=217145&creative=399373&creativeASIN=B01F4710ES"

    deal_3 = self.new
    deal_3.name = "Sergeant Jyn Erso"
    deal_3.price = "$13.94"
    deal_3.discount = "44%"
    deal_3.availability = true
    deal_3.url = "https://www.amazon.com/gp/product/B01CVGV928/ref=as_li_ss_tl?ie=UTF8&tag=bargainwatchusa-20&linkCode=as2&camp=217145&creative=399373&creativeASIN=B01CVGV928"

    [deal_1, deal_2, deal_3]
  end
end
