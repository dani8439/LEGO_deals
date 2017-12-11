class LEGODeals::CLI

  def call
    list_deals
    menu
    goodbye
  end

  def list_deals
    puts "Today's Biggest Discounts:"
    puts "1. Police Starter Set - $5.59 - 44% Discount - SOLD OUT AT SHOP.LEGO.COM on 25 Nov 2017"
    puts "2. Sergeant Jyn Erso - $14.20 - 43% Discount"
    puts "3. Harley Quinn to the Rescue - $17.49 - 43% Discount"
  end

  def menu
    input = nil
    while input != "exit"
      puts "Enter the number of the item you would like more info on, or type list to see the deals again, or exit:"
      input = gets.strip.downcase
      case input
      when "1"
        puts "More info on item 1..."
      when "2"
        puts "More info on item 2.."
      when "3"
        puts "More info on item 3..."
      when "list"
        list_deals
      end
    end
  end

  def goodbye
    puts "See you tomorrow for more deals!"
  end
end
