class Cli
   $name = "" #global variable to be able to aceess and intrpolate name anywhere in my program
   def initialize
      puts "please enter your name"
      $name = gets.strip.upcase
      puts ". . . . . . . . . . . . WELCOME #{$name} TO THE KITCHEN OF. . . . . . . . . . . . . . . . . . . ."
      puts ".......................DELICIOUS HOLIDAY DESSERTS.........................................."
     
      welcome_user
    
   end

  
   def welcome_user
      puts "Are you ready to enter the kitchen? yes/no"
      response = gets.strip.downcase
    if response == "yes"
       puts ""
       puts "FANTASTICO! Let's put on our aprons and get started #{$name}!"
         Api.get_recipes
         print_recipe_list
     
    elsif response == "no"
       puts "It was a pleasure to have you in our kitchen today #{$name}, come back again soon!"
    else
       puts "please reply yes or no"
       welcome_user
    end
   end 
   
   def print_recipe_list
      puts "Please wait one moment while I run in the kitcken and retrive the recipe book!"
      puts ""
      puts ""
      puts ""
      puts ""
    
      
      puts "Thank you for your patience chef! Here are your options!"
      Recipes.all.each.with_index(1) do |recipe, i| #allows me to choose what number i start my list with
      puts "#{i}. Title: #{recipe.title} | Bake Time:#{recipe.ready_in_minutes} | Servings:#{recipe.servings}"
     
     end
      recipe_link
   end
     
    def recipe_link
       response = nil #give response a default value to avoid breaking code
       while response != "exit" 
         puts ""
       puts "*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*" 
       puts "*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*"
       puts ""
       puts "To see more information about each recipe just type in the number corresponding to the recipe!"
       puts ""
       puts "If you'd like to leave the kitchen, simply type 'exit'"
       puts ""
       puts "if you would like to see the recipes again, type 'list'"

       response = gets.strip.downcase
       if response.to_i > 0 && response.to_i <= Recipes.all.count.to_i
          new_recipe = Recipes.all[response.to_i-1]   
          puts "#{new_recipe.source_url}" 
       elsif response == "list"
           print_recipe_list 
       elsif response == "exit"
          puts "It was a pleasure having you today chef, come back again soon!" 
          exit 
       else 
        puts "Sorry, that item is not in our kitchen!"
        recipe_link
        end
      end
   end
    
end    
   