@starter_with_price = {"Soup" => 200, "Rolls" => 80, "Sandwiches" => 100, "Cutlets" => 250, "None" => 0}
@starter = {1 => "Soup", 2 => "Rolls", 3 => "Sandwiches", 4 => "Cutlets", 5 => "None"}

@dishes_with_price = {"Karahi" => 600, "Biryani" => 150, "Burger" => 100, "None" => 0}
@dishes = {1 => "Karahi", 2 => "Biryani", 3 => "Burger", 4 => "None"}

@dessert_with_price = {"Icecream" => 70, "Brownie" => 50, "Cookies" => 40, "None" => 0}
@dessert = {1 => "Icecream", 2 => "Brownie", 3 => "Cookies", 4 => "None"} 

@starter_hash = Hash.new
@dishes_hash = Hash.new
@dessert_hash = Hash.new
@total = 0

def info
  print "\nEnter Your Name : "
  @name = gets.chomp
  print "\nEnter Your Address : "
  ddress = gets.chomp
  print "\nEnter Your Phone Number : "
  @number = gets.chomp
end

def starter_menu
  puts "\n\n** Starters **" 
  @starter.each do |starter_id, starter_name|
   starter_price = @starter_with_price[starter_name]
   puts "#{starter_id} - #{starter_name} #{starter_price}"
  end
  print "Please select your starter : "
  @st_id = gets.chomp
  @starter_item = @starter[@st_id.to_i]
  if @st_id.to_i <= 5
    print "Enter quantity of item : "
    @starter_quantity = gets.chomp
    @starter_hash[@starter_item] = @starter_quantity.to_i
    print "\nWould you like to select another starter ? "
    @starter_choice = gets.chomp
    if @starter_choice == "yes"
     starter_menu()
    elsif @starter_choice == "no"
      dishes_menu()
    else
      print "\n Enter a correct option\n"
      starter_menu()
    end
  else
    print "\nPlease enter a valid item id..."    
    starter_menu()
  end 
end

def dishes_menu
  puts "\n\n** dishes **" 
  @dishes.each do |dishes_id, dishes_name|
   dishes_price = @dishes_with_price[dishes_name]
   puts "#{dishes_id} - #{dishes_name} #{dishes_price}"
  end
  print "Please select your dishes : "
  @dis_id = gets.chomp
  @dishes_item = @dishes[@dis_id.to_i]
  if @dis_id.to_i <= 4
    print "Enter quantity of item : "
    @dishes_quantity = gets.chomp
    @dishes_hash[@dishes_item] = @dishes_quantity.to_i
    print "\nWould you like to select another dishes ? "
    @dishes_choice = gets.chomp
    if @dishes_choice == "yes"
      dishes_menu()
    elsif @dishes_choice == "no"
      dessert_menu()
    else
      print "\n Enter a correct option\n"
      dishes_menu()
    end
  else
    print "\nPlease enter a valid item id..."    
    dishes_menu()
  end
end

def dessert_menu
  puts "\n\n** desserts **" 
  @dessert.each do |dessert_id, dessert_name|
   dessert_price = @dessert_with_price[dessert_name]
   puts "#{dessert_id} - #{dessert_name} #{dessert_price}"
  end
  print "Please select your dessert : "
  @des_id = gets.chomp
  @dessert_item = @dessert[@des_id.to_i]
  if @des_id.to_i <= 4
    print "Enter quantity of item : "
    @dessert_quantity = gets.chomp
    @dessert_hash[@dessert_item] = @dessert_quantity.to_i
    print "\nWould you like to select another dessert ? "
    @dessert_choice = gets.chomp
    if @dessert_choice == "yes"
      dessert_menu()
    elsif @dessert_choice == "no"
      receipt(@name,@address,@number,@starter_item,@dishes_item,@dessert_item)
    else
      print "\n Enter a correct option\n"
      dessert_menu()
    end
  else
    print "\nPlease enter a valid item id..."    
    dessert_menu()
  end 
end

def receipt(name,address,number,starter_item,dishes_item,dessert_item)
  print "\n\n** Receipt **\n\n"
  print "Your name is : "
  puts name 
  print "Your address is : "
  puts address
  print "Your phone number is : "
  puts number
  
   
   @starter_hash.each do |starter_item, starter_quantity| 
    	starter_hash_price = @starter_with_price[starter_item]
      puts "You Ordered #{starter_quantity.to_i} #{starter_item} that cost #{starter_hash_price * starter_quantity.to_i}"
      @total = @total + (starter_hash_price * starter_quantity.to_i) 
   end
   @dishes_hash.each do |dishes_item, dishes_quantity| 
      dishes_hash_price = @dishes_with_price[dishes_item]
      puts "You Ordered #{dishes_quantity.to_i} #{dishes_item} that cost #{dishes_hash_price * dishes_quantity.to_i}"
      @total = @total + (dishes_hash_price * dishes_quantity.to_i) 
   end
   @dessert_hash.each do |dessert_item, dessert_quantity| 
      dessert_hash_price = @dessert_with_price[dessert_item]
      puts "You Ordered #{dessert_quantity.to_i} #{dessert_item} that cost #{dessert_hash_price * dessert_quantity.to_i}"
      @total = @total + (dessert_hash_price * dessert_quantity.to_i) 
   end
  print "\nYour total amount is : "
  puts @total
end

info()
starter_menu()