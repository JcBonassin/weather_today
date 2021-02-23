class WeatherToday::CLI

    def call
        welcome
        menu
        #forecast
        #bye
    end
    
    def welcome
        #system('cls') || system('clear')
        puts "welcome to today's weather"

        @weather = WeatherToday::Weather.api_location
        @weather.each do |weather_today|
            puts "#{weather_today.location} - #{weather_today.date} - #{weather_today.temp} - #{weather_today.decription}"
        end
        @forecast = WeatherToday::Weather.api_forecast
        @forecast.each do |forecast|
        display_forecast(forecast)
        end
    end
        
    def menu
        input = nil
        # out f for forecast 
        puts "
            Please select: 

            
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
            #elsif input == "f"
            #    sleep(0.5)
            #    the_forecast = @forecast[input.to_i]
            #    puts "#{the_forecast.dt_1} - #{the_forecast.dt_2} - #{the_forecast.dt_3}"
            #    puts ''
            #    puts "#{the_forecast.temp_1}ºF  - #{the_forecast.temp_2}ºF  - #{the_forecast.temp_3}ºF "
            #    puts ''
            #    puts "#{the_forecast.weather_1} - #{the_forecast.weather_2} - #{the_forecast.weather_3}"
            #    puts ''
            #    puts "#{the_forecast.humidity_1}% "
            #    menu
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
                forecast_2 = WeatherToday::Search.select_forecast(new_input)
                display_forecast2(forecast_2)
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
            #system('cls') || system('clear') #clear the screen 
            #puts ''   a free space 
            new_entry
            elsif answer.downcase == "n"
                bye
            else 
             p "dude learn good types manners ;)  ... Try again!!!"
             new_entry
            end
        end 
    end


    def weather_location(weather1)

        puts "#{weather1.date}-#{weather1.temp}-#{weather1.conditions}"
         
    end

    def weather_enquire(weather_location)
        puts "local time #{weather_location.time}"
    end 


    def display_forecast(forecast)

        puts "#{forecast.dt_1} - #{forecast.dt_2} - #{forecast.dt_3}"
        puts ''
        puts "#{forecast.temp_1}ºF- #{forecast.temp_2}ºF  - #{forecast.temp_3}ºF "
        puts ''
        puts "#{forecast.weather_1} - #{forecast.weather_2} - #{forecast.weather_3}"
        puts ''
        puts "#{forecast.humidity_1}% "
        
    end

    def display_forecast2(forecast_2)

      
        puts "#{forecast_2.temp_1}ºF - #{forecast_2.temp_2}ºF  - #{forecast_2.temp_3}ºF - #{forecast_2.temp_4}ºF"
        puts ''
        puts "#{forecast_2.dt_1} - #{forecast_2.dt_2} - #{forecast_2.dt_3}- #{forecast_2.dt_4}"
        #puts ''
        #puts "#{forecast.weather_1} - #{forecast.weather_2} - #{forecast.weather_3}"
        #puts ''
        #puts "#{forecast.humidity_1}% "
         
     end
    
    
   

    def bye
        puts "thanks for checking the weather. Get ready to go out"
        exit 
    end     


end