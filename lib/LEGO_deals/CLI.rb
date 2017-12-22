class LEGODeals::CLI

  def call
    welcome
    list_vendors
    menu_1
    LEGODeals::Deal.today
    list_deals
    menu_2
    goodbye
  end

  def welcome
    puts "Welcome to LEGO Deals!"
    sleep(1)
    puts "Please choose a vendor to discover today's biggest discounts:"
    puts "Here are today's Biggest Discounts:"
    puts "-----------------------------------"
    sleep(1)
  end

  def list_vendors
    vendors = ["Amazon", "Bricklink", "Chowren Toys", "LEGO Shop", "Walmart"]
    vendors.each.with_index(1) do |store, i|
      puts "#{i}. #{store}"
    end
  end

  def menu_1
    input = nil
    puts ""
    puts "Please enter the number of the vendor you would like today's deals from:"
    input = gets.strip.downcase

    case input
    when input == "1"
      list_deals("Amazon")
    when input == "2"
      list_deals("Bricklink")
    when input == "3"
      list_deals("Chowren Toys")
    when input == "4"
      list_deals("LEGO")
    when input == "5"
      list_deals("Walmart")
    when input == "list"
      list_vendors
    when input == "exit"
      puts "Goodbye!"
      exit
    else
      "Not sure what you want, type list to see vendors again, or exit"
    end
  end

  def list_deals
    @deals = LEGODeals::Deal.all
    @deals.each.with_index(1) do |deal, i|
      puts "#{i}. #{deal.name} #{deal.price}"
    end
    menu
  end


  def menu_2
    input = nil
    while input != "exit"
      puts ""
      puts "Enter the number of the item you would like more info on, or type list to see the deals again, or exit:"
      puts ""
      input = gets.strip.downcase

      if input.to_i > 0 && input.to_i < 26
        the_deal = @deals[input.to_i-1]
        puts ""
        puts "#{the_deal.name} - Sale Price: #{the_deal.price} - Original Price:#{the_deal.original_price} - Discount of #{the_deal.discount}"
        puts "Set Number: #{the_deal.set_number} - Year Released: #{the_deal.year_released} - Pieces & Price Per Piece: #{the_deal.pieces}"
        puts "Link: #{the_deal.url}"
        puts ""
      elsif input == "list"
        list_deals
      elsif input == "exit"
        puts "Goodbye!"
        exit
      else
        puts "Not sure what you want, type list or exit."
      end
    end
  end

  def goodbye
    puts "See you tomorrow for more deals!"
  end
end




  # def menu_1
  #   input = nil
  #   while input != "exit"
  #     puts "Please choose a vendor from the list:"
  #     input = gets.strip.downcase
  #
  #     if input == "1"
  #       list_deals
  #       # list_deals("Amazon")?
  #     elsif input == "2"
  #       list_deals
  #       # list_deals("Bricklink")
  #     elsif input == "3"
  #       list_deals
  #       # list_deals("Chowren Toys")
  #     elsif input == "4"
  #       list_deals
  #       # list_deals("LEGO")
  #     elsif input == "5"
  #       list_deals
  #       # list_deals("Walmart")
  #     else
  #       puts "Not sure what you want, type list or exit."
  #     end
  #   end
  # end
