class WeatherToday::CLI

    def call
        welcome
        menu
        #forecast
        #bye
    end
    
    def welcome
        puts "welcome to today's weather"

        @weather = WeatherToday::Weather.api_location
        @weather.each do |weather_today|
            puts "#{weather_today.location} - #{weather_today.date} - #{weather_today.temp} - #{weather_today.decription}"
        end
        #p @weather
        #end
        @forecast = WeatherToday::Weather.api_forecast
    end
        
    def menu
        input = nil
        puts "
            Please select: 

            f for forecast 
            u for more useful data
            m for main menu
            c to check another city
            q to exit "   
        while input != "q"
            input = gets.chomp.downcase
            if input == "u" 
                the_weather = @weather[input.to_i]
                puts "#{the_weather.date} - #{the_weather.location} - #{the_weather.temp} - #{the_weather.decription}"
            elsif input == "m"
                welcome
            elsif input == "f"
                the_forecast = @forecast[input.to_i]
                puts "#{the_forecast.day_1} - #{the_forecast.temp_max} - #{the_forecast.conditions}"
                menu
            elsif input == "c" 
                new_entry  
            elsif input == "q"
                    bye
            else puts "sorry you didn't select the right option. Please try again"   
            end    
        end 

        
          
        
    end  

    def new_entry
        new_input = nil
        puts " please type the city of your preference or exit to main menu"
        while new_input != "q"
            new_input = gets.chomp.downcase
            if new_input === "exit" 
                menu
                else
            end 

            if new_input.empty?
                new_entry
            elsif
                weather1 = WeatherToday::Search.select_name(new_input)
                weather_location(weather1)
                weather_location = WeatherToday::Search.current_time(new_input)
                weather_enquire(weather_location)
                yesno
            else 
                new_input = nil
                new_entry
            end 
        end
    end

    def yesno 
        puts "Do you want to check another location (Y/N)?"
        answer = nil 
        answer = gets.chomp.downcase
        while answer != "exit" 
            if answer.downcase == "y"
            new_entry
            elsif answer.downcase == "n"
                bye
            else 
             p "dude learn good types manners ;)  ... Try again!!!"
             new_entry
            end
        end 
    end

    #puts "Do you like this?"
    #answer = gets.strip
    #if answer.downcase == "yes"
    #    puts "Me too"
    #  else
    #    puts "Whyyyy?"
    #  end
#



    #        new_input = gets.chomp.downcase
    #        weather1 = WeatherToday::Search.select_name(new_input)
    #        weather_location(weather1)
    #        weather_location = WeatherToday::Search.current_time(new_input)
    #        weather_enquire(weather_location)    
    #        p "please type a new city or exit to return to the main menu"
#
    #        if new_input.empty?
    #            menu
    #        end 
    #        if new_input === "exit"
    #            menu
    #        end 
    #    end 
#
    #end


    def weather_location(weather1)

        puts "#{weather1.date} - #{weather1.temp} - #{weather1.conditions}"

         
    end

    def weather_enquire(weather_location)
        puts "local time #{weather_location.time}"
    end 



    
    
   #def forecast
   #    puts <<-DOC
   #         temp_min
   #         temp_max
   #         Conditions
   #     DOC
   # end

    def bye
        puts "thanks for checking the weather. Get ready to go out"
        exit 
    end     


end