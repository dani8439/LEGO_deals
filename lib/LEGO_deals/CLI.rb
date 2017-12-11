class LEGODeals::CLI

  def call
    puts "Today's Best Sales:"
    list_deals
  end

  def list_deals
    puts "1. Police Starter Set - $5.59 - 44% Discount - SOLD OUT AT SHOP.LEGO.COM on 25 Nov 2017"
    puts "2. Sergeant Jyn Erso - $14.20 - 43% Discount"
    puts "3. Harley Quinn to the Rescue - $17.49 - 43% Discount"
  end
end
