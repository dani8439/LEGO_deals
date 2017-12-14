class LEGODeals::CLI

  def call
    list_vendors
    list_deals
    menu
    goodbye
  end

  def list_vendors
    puts "Welcome to LEGO Deals!"
    
  end

  def list_deals
    puts "Today's Biggest Discounts:"
    @deals = LEGODeals::Deal.today
    @deals.each.with_index(1) do |deal, i|
      puts "#{i}. #{deal.name} - #{deal.price} - #{deal.pieces} - #{deal.availability}"
    end
  end

  def menu
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
