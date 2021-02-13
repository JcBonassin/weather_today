class WeatherToday::CLI

    def call
        welcome
        menu
        select_location
        #forecast
        #bye
    end
    
    def welcome
        #puts "welcome to today's weather"

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
        while input != "q"
            puts "
            Please select: 

            f for forecast 
            u for more useful data
            m for main menu
            c to check another city
            q to exit "   
            input = gets.chomp.downcase
            if input == "u" 
                the_weather = @weather[input.to_i]
                puts "#{the_weather.date} - #{the_weather.location} - #{the_weather.temp} - #{the_weather.decription}"
            elsif input == "m"
                welcome
            elsif input == "f"
                the_forecast = @forecast[input.to_i]
                puts "#{the_forecast.day_1} - #{the_forecast.temp_max} - #{the_forecast.conditions}"
            elsif input == "q"
                bye
            elsif input == "c" 
                select_location   
            #case input
            #when "f"
            #    forecast
            #when "u"
            #    puts "useful date"
            #when "m"
            #    welcome    
            #when "q" 
            #    bye  
            else puts "sorry you didn't select the right option. Please try again"        
            end
        end 
    end   

    def select_location
        puts " please type the city of country of yout preference "
        input = gets.chomp.downcase
        if input.empty? 
            menu
        elsif
            weather1 = WeatherToday::Weather.select_location(input)
            weather_location(weather1)
        else 
            input = nil 
            menu
            
        end 
    end 

    

    def weather_location(weather1)
         p "#{weather1.decription}"
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
    end     


end