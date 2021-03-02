class WeatherToday::CLI

   
    $prompt = TTY::Prompt.new 

    def call
        welcome
        menu
        #forecast
        #bye
    end
    
    def welcome
        #system('cls') || system('clear')
        puts ''
        puts "welcome to today's weather"
        puts ''

        puts "Forecast".colorize(:red)
        puts ''
     
        forecast = WeatherToday::Weather.api_forecast
        display_forecast(forecast)

        puts ''
        weather = WeatherToday::Weather.api_location
        current_weather(weather)
        puts ''
        puts "News Highlights"
        news = WeatherToday::Weather.news
        news_feed_(news)
    

        
    end
        
    def menu
        answer = $prompt.select('Main Menu:', ["for more useful data","for more news","to check another city", "to exit"], require: true)
        #input = nil
        # out f for forecast 
        case answer
        when "for more useful data"
            weather = WeatherToday::Weather.api_location
            current_weather(weather)
            menu
        when "for more news"
            #system "clear"
            WeatherToday::Weather.open_link
            menu
        when "to check another city"
            new_entry 
        when "to exit"
            bye
        else
            puts "sorry you didn't select the right option. Please try again"  
        end

        #puts "
        #    Please select: 

        #    
        #    u for more useful data
        #    m for main menu
        #    c to check another city
        #    q to exit "   
        #while input != "q"
        #    input = gets.chomp.downcase
        #    if input == "u" 
        #        the_weather = @weather[input.to_i]
        #        puts "#{the_weather.date} - #{the_weather.location} - #{the_weather.temp}ºF - #{the_weather.decription}"
        #    elsif input == "m"
        #        welcome
        #    elsif input == "c" 
        #        new_entry  
        #    elsif input == "q"
        #            bye
        #    else puts "sorry you didn't select the right option. Please try again"   
        #    end    
        #end 
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
            #puts ''   #a free space 
            new_entry
            elsif answer.downcase == "n"
                bye
            else 
             p "dude learn good types manners ;)  ... Try again!!!"
             new_entry
            end
        end 
    end



    def current_weather(weather)

        puts "Today in  #{weather.location} - #{weather.temp}ºF - #{weather.decription} - (min: #{weather.temp_min}ºF /max: #{weather.temp_max}ºF)"  
        puts ''
        puts "Feels like #{weather.feels}ºF "
    end 


    def weather_location(weather1)

        puts "#{weather1.temp}ºF - #{weather1.conditions}" #{weather1.date}
         
    end

    def weather_enquire(weather_location)
        puts "Local time #{weather_location.time}"
    end 


    def display_forecast(forecast)
        
        puts "#{forecast.dt_1} - #{forecast.dt_2} - #{forecast.dt_3}"
        puts ''
        puts "#{forecast.temp_1}ºF- #{forecast.temp_2}ºF  - #{forecast.temp_3}ºF "
        puts ''
        puts "#{forecast.weather_1} - #{forecast.weather_2} - #{forecast.weather_3}"
        puts ''
        puts "#{forecast.humidity_1}% - #{forecast.humidity_2}% - #{forecast.humidity_3}%  "
      
        
    end

    def display_forecast2(forecast_2)

        puts ''
        puts  "Forecast"
        puts ''
        puts "#{forecast_2.temp_1}ºF - #{forecast_2.temp_2}ºF  - #{forecast_2.temp_3}ºF - #{forecast_2.temp_4}ºF"
        puts '' 
        puts "#{forecast_2.dt_1} - #{forecast_2.dt_2} - #{forecast_2.dt_3}- #{forecast_2.dt_4}"
        puts ''
        #puts "#{forecast.weather_1} - #{forecast.weather_2} - #{forecast.weather_3}"
        #puts ''
        #puts "#{forecast.humidity_1}% "
         
     end

     def news_feed_(news)

        #answer = $prompt.multi_select('News:', ["#{news.title_1}","#{news.title_2}","#{news.title_3}", "#{news.title_4}"], require: true)
        #
        #case answer
        #when "#{news.title_1}"
        #    WeatherToday::Weather.open_link
        #when "#{news.title_2}"
        #    WeatherToday::Weather.open_link
        #when "#{news.title_3}"
        #    WeatherToday::Weather.open_link
        #when "#{news.title_4}"
        #    WeatherToday::Weather.open_link
        #else
        #    WeatherToday::Weather.open_link
        #end


        puts ''
        #WeatherToday::Weather.open_link
        puts ''
        puts "#{news.title_1}"
        puts ''
        puts "#{news.title_2}"
        puts ''
        puts "#{news.title_3}"
        puts ''
        puts "#{news.title_4}"
        
     end
    
   

    def bye
        puts "thanks for checking the weather. Get ready to go out"
        exit 
    end     



end