class LEGODeals::CLI

  def call
    welcome
    LEGODeals::Scraper.scrape_deals
    list_deals
    menu
    goodbye
  end

  def welcome
    puts "Welcome to LEGO Deals!"
    sleep(1)
    puts "Here are the biggest discounts currently on Amazon:"
    puts "-----------------------------------"
    sleep(1)
  end

  def list_deals
    @deals = LEGODeals::Deal.all
    @deals.each.with_index(1) do |deal, i|
      puts "#{i}. #{deal.name} - #{deal.theme} - #{deal.price}"
    end
    menu
  end


  def menu
    input = nil
    while input != "exit"
      puts ""
      puts "Enter the number of the item you would like more info on, or type list to see the deals again, or exit:"
      puts ""
      input = gets.strip.downcase

      if input.to_i.between?(1, 20)    #input.to_i > 0 && input.to_i < 15
        the_deal = @deals[input.to_i-1]
        puts ""
        puts "#{the_deal.name} - Sale Price: #{the_deal.price} - Original Price:#{the_deal.original_price} - Discount of #{the_deal.discount}"
        puts "Set Number: #{the_deal.set_number} - Set Theme: #{the_deal.theme} - Year Released: #{the_deal.year_released} - Pieces & Price Per Piece: #{the_deal.pieces}"
        puts "Link: #{the_deal.url}"
        puts ""
      elsif input == "list"
        list_deals
      elsif input == "exit"
        goodbye
        exit
      else
        puts "Not sure what you want, type list or exit."
      end
    end
  end

  def goodbye
    puts "Goodbye!"
    puts "See you later for more deals!"
  end
end
