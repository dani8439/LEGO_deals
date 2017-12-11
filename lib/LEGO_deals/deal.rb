class LEGODeals::Deal

  def self.today
    puts "1. Police Starter Set - $5.59 - 44% Discount - SOLD OUT AT SHOP.LEGO.COM on 25 Nov 2017"
    puts "2. Sergeant Jyn Erso - $14.20 - 43% Discount"
    puts "3. Harley Quinn to the Rescue - $17.49 - 43% Discount"
    deal_1 = Deal.new
    deal_1.name = "Police Starter Set"
    deal_1.price = "$5.59"
    deal_1.discount = "44%"
    deal_1.availability = true
  end
end
