class WeatherToday::CLI

   
    $prompt = TTY::Prompt.new(active_color: :cyan)
   
    def call
        welcome
        menu
        #forecast
        #bye
    end
    
    def welcome
        #system('cls') || system('clear')
        puts ''
        puts "Welcome to today's weather"
        puts ''

        puts ''
        weather = WeatherToday::Weather.api_location
        current_weather(weather)
        puts ''

        puts "Forecast".colorize(:red)
        puts ''
     
        forecast = WeatherToday::Weather.api_forecast
        display_forecast(forecast)

        puts "World's News"
        news = WeatherToday::Weather.news
        news_feed_(news)
        puts ''

        menu 
        puts ''

        
    end
        
    def menu
        answer = $prompt.select('Main Menu:', ["for more useful data","for more news","to check another city", "to exit"], require: true)
        case answer
        when "for more useful data"
            weather = WeatherToday::Weather.api_location
            current_weather(weather)
            menu
        when "for more news"
            #system "clear"
            news_display = WeatherToday::Weather.news
            news_display(news_display)
            menu
        when "to check another city"
            new_entry 
        when "to exit"
            bye
        else
            puts "sorry you didn't select the right option. Please try again"  
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
                #weather_location = WeatherToday::Search.current_time(new_input)
                #weather_enquire(weather_location)
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
                menu
            else 
             p "dude learn good types manners ;)  ... Try again!!!"
             new_entry
            end
        end 
    end



    def current_weather(weather)
        puts "Today in  #{weather.location}  #{weather.decription.graph_cond}   \u{1F307} #{weather.sunrise} #{weather.sunset}"  
        puts ''     
        puts "#{weather.decription.quotes}".colorize(:red)
        puts ''
        puts "#{weather.temp}ºF - (min: #{weather.temp_min}ºF /max: #{weather.temp_max}ºF)"  
        puts ''
        puts "Feels like #{weather.feels}ºF - Humidity #{weather.humidity}% - Pressure #{weather.pressure} mb"
        puts ''
        
    end 


    def weather_location(weather1)

     puts "#{weather1.temp}ºF - #{weather1.conditions.graph_cond}" #{weather1.date}"
         
    end

    def weather_enquire(weather_location)
        puts "Local time #{weather_location.time}"
    end 


    def display_forecast(forecast)

       forecast_table_1 = TTY::Table.new(["#{forecast.dt_1}","#{forecast.dt_2}","#{forecast.dt_3}"], 
                                         [["#{forecast.weather_1.graph_cond}","#{forecast.weather_2.graph_cond}","#{forecast.weather_3.graph_cond}"],
                                         ["#{forecast.temp_1}ºF","#{forecast.temp_2}ºF","#{forecast.temp_3}ºF"],
                                         ["#{forecast.humidity_1}%","#{forecast.humidity_2}%","#{forecast.humidity_3}%"],
                                         ["#{forecast.pop.to_i}%\u{1F4A7}","#{forecast.pop_2.to_i}%\u{1F4A7}","#{forecast.pop_3.to_i}%\u{1F4A7}"]])
        
        puts forecast_table_1.render(:unicode, padding: [1, 2], alignments: [:center, :center, :center]) { |renderer|
        #renderer.border.separator = :each_row
        renderer.border.style = :blue
      } 
        

        #puts forecast_table_1.render(:unicode, padding: [1, 2], alignments: [:center, :center, :center])
                                      
        
       # puts "#{forecast.dt_1} - #{forecast.dt_2} - #{forecast.dt_3}"
       # puts ''
       # puts "#{forecast.temp_1}ºF - #{forecast.temp_2}ºF - #{forecast.temp_3}ºF "
       # puts ''
       # puts "#{forecast.weather_1.graph_cond}  #{forecast.weather_2.graph_cond}  #{forecast.weather_3.graph_cond}"
       # puts ''
       # puts "#{forecast.humidity_1}% - #{forecast.humidity_2}% - #{forecast.humidity_3}%"
       # puts ''
       # puts "#{forecast.pop}%\u{1F4A7} #{forecast.pop_2}%\u{1F4A7} #{forecast.pop_3}%\u{1F4A7}" 
       # puts ''
       puts ''
        
    end

    def display_forecast2(forecast_2)
       
        puts  "Forecast".colorize(:red)
        puts ''

        forecast_table_2 = TTY::Table.new(["#{forecast_2.dt_1}","#{forecast_2.dt_2}","#{forecast_2.dt_3}","#{forecast_2.dt_4}"], 
                                         [["#{forecast_2.weather_1.graph_cond}","#{forecast_2.weather_2.graph_cond}","#{forecast_2.weather_3.graph_cond}","#{forecast_2.weather_4.graph_cond}"],
                                         ["#{forecast_2.temp_1}ºF","#{forecast_2.temp_2}ºF","#{forecast_2.temp_3}ºF","#{forecast_2.temp_4}ºF"],
                                         ["#{forecast_2.humidity_1}%","#{forecast_2.humidity_2}%","#{forecast_2.humidity_3}%","#{forecast_2.humidity_4}%"],
                                         ["#{forecast_2.pop.to_i}%\u{1F4A7}","#{forecast_2.pop_2.to_i}%\u{1F4A7}","#{forecast_2.pop_3.to_i}%\u{1F4A7}","#{forecast_2.pop_4.to_i}%\u{1F4A7}"]])
        
        puts forecast_table_2.render(:unicode, padding: [1, 2], alignments: [:center, :center, :center]) { |renderer|
        #renderer.border.separator = :each_row
        renderer.border.style = :red
      } 

       # puts ''
       # puts  "Forecast"
       # puts ''
       # puts "#{forecast_2.temp_1}ºF - #{forecast_2.temp_2}ºF  - #{forecast_2.temp_3}ºF - #{forecast_2.temp_4}ºF"
       # puts '' 
       # puts "#{forecast_2.dt_1} - #{forecast_2.dt_2} - #{forecast_2.dt_3}- #{forecast_2.dt_4}"
       # puts ''
       # #puts "#{forecast.weather_1} - #{forecast.weather_2} - #{forecast.weather_3}"
       # #puts ''
       # #puts "#{forecast.humidity_1}% "
         
     end

     def news_feed_(news)
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

    def news_display(news)

     answer = $prompt.select('News:', ["#{news.title_1}","#{news.title_2}","#{news.title_3}", "#{news.title_4}", "main menu"], require: true)
       
       case answer
       when "#{news.title_1}"
           WeatherToday::Weather.open_link
           news_display(news)
       when "#{news.title_2}"
           WeatherToday::Weather.open_link_2     
           news_display(news)
       when "#{news.title_3}"
           WeatherToday::Weather.open_link_3
           news_display(news)
       when "#{news.title_4}"
           WeatherToday::Weather.open_link_4 
           news_display(news)       
       else
           menu
       end
    end 

    
   

    def bye
        puts "thanks for checking the weather. Get ready to go out"
        exit 
    end     



end