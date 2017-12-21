class LEGODeals::CLI

  def call
    welcome
    # list_vendors
    # menu_1
    list_deals
    menu
    goodbye
  end

  def welcome
    puts        "Welcome to LEGO Deals!"
    sleep(1)
    puts "Here are today's Biggest Discounts:"
    puts "-----------------------------------"
    sleep(1)
  end

  def list_deals
    @deals = LEGODeals::Deal.today
    @deals.each.with_index(1) do |deal, i|
      puts "#{i}. #{deal.name} #{deal.price}"
      puts ""
    end
    menu
  end


  def menu
    input = nil
    while input != "exit"
      puts "Enter the number of the item you would like more info on, or type list to see the deals again, or exit:"
      input = gets.strip.downcase

      if input.to_i > 0 && input.to_i < 25
        the_deal = @deals[input.to_i-1]
        puts "#{the_deal.name} - #{the_deal.price} - #{the_deal.original_price} - #{the_deal.discount}"
        puts "#{the_deal.set_number} - #{the_deal.theme} - #{the_deal.pieces} - #{the_deal.url}"
      elsif input == "list"
        list_deals
      # elsif input == "exit"
      #   puts "Goodbye!"
      else
        puts "Not sure what you want, type list or exit."
      end
    end
  end

  def goodbye
    puts "See you tomorrow for more deals!"
  end
end


  # def list_vendors
  #   vendors = ["Amazon", "Bricklink", "Chowren Toys", "LEGO Shop", "Walmart"]
  #   puts "Welcome to LEGO Deals!"
  #   vendors.each.with_index(1) do |store, i|
  #     puts "#{i}. #{store}"
  #   end
  # end

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
