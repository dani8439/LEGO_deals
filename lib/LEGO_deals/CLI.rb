class LEGODeals::CLI

  def call
    list_vendors
    menu_1
    list_deals
    menu_2
    goodbye
  end

  def list_vendors
    vendors = ["Amazon", "Bricklink", "Chowren Toys", "LEGO Shop", "Walmart"]
    puts "Welcome to LEGO Deals!"
    vendors.each.with_index(1) do |store, i|
      puts "#{i}. #{store}"
    end
  end


  def list_deals
    puts "Today's Biggest Discounts:"
    @deals = LEGODeals::Deal.today
    @deals.each.with_index(1) do |deal, i|
      puts "#{i}. #{deal.name} - #{deal.price} - #{deal.pieces} - #{deal.availability}"
    end
  end

  def menu_1
    input = nil
    while input != "exit"
      puts "Please choose a vendor from the list:"
      input = gets.strip.downcase

      if input == "1"
      elsif input == "2"
      elsif input == "3"
      elsif input == "4"
      elsif input == "5"
        
      case input
      when "1"
        puts "More info on Amazon Deals..."
      when "2"
        puts "More info on Bricklink Deals..."
      when "3"
        puts "More info on Chowren Toys Deals..."
      when "4"
        puts "More info on LEGO Shop at Home deals..."
      when "5"
        puts "More info on Walmart Deals..."
      when "list"
        list_vendors
      end
    end
  end

  def menu_2
    input = nil
    while input != "exit"
      puts "Enter the number of the item you would like more info on, or type list to see the deals again, or exit:"
      input = gets.strip.downcase

      if input.to_i > 0
        the_deal = @deals[input.to_i-1]
        puts "#{the_deal.name} - #{the_deal.price} - #{the_deal.pieces} - #{the_deal.availability}"
      elsif input == "list"
        list_deals
      else
        puts "Not sure what you want, type list or exit."
      end
    end
  end

  def goodbye
    puts "See you tomorrow for more deals!"
  end
end
