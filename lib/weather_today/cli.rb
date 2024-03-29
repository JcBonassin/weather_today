class WeatherToday::CLI

    $prompt = TTY::Prompt.new(active_color: :cyan)
   
    def call
        welcome
    end
    
    def welcome
        puts Rain.go 
        puts Intro.go 
        sleep (3)
        puts"
                                             .-. .-.  ,---.   ,-.     ,-.      .---.   
                                             | | | |  | .-'   | |     | |     / .-. )  
                                             | `-' |  | `-.   | |     | |     | | |(_) 
                                             | .-. |  | .-'   | |     | |     | | | |  
                                             | | |)|  |  `--. | `--.  | `--.  \ `-' /  
                                             /(  (_)  /( __.' |( __.' |( __.'  )---'   
                                            (__)     (__)     (_)     (_)     (_)     
    ".colorize(:cyan)
         units_selection
         puts ''
         puts "World's News"
         puts ''
         news = WeatherToday::Weather.news
         news_feed_(news)
         sleep (2)
         puts ''
         menu 
         puts ''      
    end

    def home
        system('cls') || system('clear')
        units_selection
        news = WeatherToday::Weather.news
        news_feed_(news)
        menu
    end


    def units_selection
        answer = $prompt.select('Please select your weather settings?:', ["Imperial (For temperature in Fahrenheit & Wind speed: miles/hour.)", "Metric (For temperature in Celsius & Wind speed: meter/sec.)", "Standard (For temperature in Kelvin & Wind speed: meter/sec.)"], require: true)
        case answer
        when "Imperial (For temperature in Fahrenheit & Wind speed: miles/hour.)"
            weather = WeatherToday::Weather.api_location("imperial")
            current_weather(weather)
            puts "Forecast in #{weather.location}".colorize(:red) 
            forecast = WeatherToday::Weather.api_forecast("imperial")
            display_forecast(forecast)
        when "Metric (For temperature in Celsius & Wind speed: meter/sec.)"
            weather = WeatherToday::Weather.api_location("metric")
            current_weather(weather)
            puts "Forecast in #{weather.location}".colorize(:red)  
            forecast = WeatherToday::Weather.api_forecast("metric")
            display_forecast(forecast)
        when "Standard (For temperature in Kelvin & Wind speed: meter/sec.)"
            weather = WeatherToday::Weather.api_location("standard")
            current_weather(weather)
            puts "Forecast in #{weather.location}".colorize(:red)
            forecast = WeatherToday::Weather.api_forecast("standard")
            display_forecast(forecast)
        else
            menu
        end 
    end

         
    def menu
        answer = $prompt.select('Main Menu:', ["Read the News","to check another city","to exit"], require: true)
        case answer
        when "Read the News"
            system('cls') || system('clear')
            news_display = WeatherToday::Weather.news
            news_display(news_display)
            menu
        when "to check another city"
            system('cls') || system('clear')
            new_entry 
        when "to exit"
            bye
        end
     end  

     def menu_2 
            answer = $prompt.select('Main Menu:', ["Read the News","to check another city","Home","to exit"], require: true)
            case answer
            when "Read the News"
                system('cls') || system('clear')
                news_display = WeatherToday::Weather.news
                news_display(news_display)
                menu
            when "to check another city"
                system('cls') || system('clear')
                new_entry 
            when "Home"
                home 
            when "to exit"
                bye
            end
        end  
     

    def new_entry
        new_input = nil
        puts "Please type the city of your preference or exit to main menu"
        while new_input != "exit"
            new_input = gets.chomp.downcase
            if new_input === "exit" 
                menu_2
                else
            end
            if new_input.empty?
                new_entry
            elsif
                answer = $prompt.select('Please section your weather settings?:', ["Imperial (For temperature in Fahrenheit & Wind speed: miles/hour.)", "Metric (For temperature in Celsius & Wind speed: meter/sec.)", "Standard (For temperature in Kelvin & Wind speed: meter/sec.)"], require: true)
                case answer
                when "Imperial (For temperature in Fahrenheit & Wind speed: miles/hour.)"
                weather1 = WeatherToday::Search.select_name("imperial", new_input)
                 if  weather1 === nil
                    begin
                        raise Error
                      rescue Error => e
                        puts e.message
                      end
                      new_entry
                 end 
                weather_location_time = WeatherToday::Search.current_time(new_input)
                weather_enquire(weather_location_time)
                weather_location(weather1)
                puts "Forecast in #{weather1.location}".colorize(:cyan)
                forecast_2 = WeatherToday::Search.select_forecast("imperial", new_input)
                display_forecast2(forecast_2)
                when "Metric (For temperature in Celsius & Wind speed: meter/sec.)"
                weather1 = WeatherToday::Search.select_name("metric", new_input)
                if  weather1 === nil
                    begin
                        raise Error
                      rescue Error => e
                        puts e.message
                      end
                      new_entry
                 end 
                weather_location_time = WeatherToday::Search.current_time(new_input)
                weather_enquire(weather_location_time)
                weather_location(weather1)
                puts "Forecast in #{weather1.location}".colorize(:red)
                forecast_2 = WeatherToday::Search.select_forecast("metric", new_input)
                display_forecast2(forecast_2)      
                when "Standard (For temperature in Kelvin & Wind speed: meter/sec.)"
                weather1 = WeatherToday::Search.select_name("standard", new_input)
                if  weather1 === nil
                    begin
                        raise Error
                      rescue Error => e
                        puts e.message
                      end
                      new_entry
                 end 
                weather_location_time = WeatherToday::Search.current_time(new_input)
                weather_enquire(weather_location_time)
                weather_location(weather1)
                puts "Forecast in #{weather1.location}".colorize(:cyan)
                forecast_2 = WeatherToday::Search.select_forecast("standard", new_input)
                display_forecast2(forecast_2) 
                end  
                search_menu
            else 
                new_input = nil
                new_entry
            end 
        end
    end


    def yesno
        answer = $prompt.select('Do you want to check another location?:', ["Yes","No"], require: true)
        case answer
        when "Yes"
            new_entry
        when "No"
            menu_2
        end 
    end

    def search_menu
        answer = $prompt.select('For more information about your location:', ["check your location on googlemaps","to check another location","Home", "exit"], require: true) 
        case answer
        when "check your location on googlemaps"
            WeatherToday::Search.open_link_search
            yesno
        when "to check another location"
            new_entry
        when "Home"
            home
        when "exit"
            bye
        end
    end  


    def current_weather(weather)
        spinner = TTY::Spinner.new("[:spinner] Hello.... fetching the weather ...", format: :star, interval: 10,  frames: %w[✶ ✸ ✹ ✺ ✹ ✷])
        20.times do
            spinner.spin
            sleep(0.2)
          end
          spinner.success
          puts ''
          puts "Today in #{weather.location}  #{weather.description.graph_cond}  \u{1F305} #{weather.sunrise} #{weather.sunset}"  

          box = TTY::Box.frame(width: 37, height: 24, border: :light, align: :center, padding: [1,3]) do
            "#{weather.description.graph_cond} #{weather.description.upcase.bold.colorize(:white)} 
            \n#{weather.temp.to_s.upcase.bold}º
            \nL:#{weather.temp_min}º H:#{weather.temp_max}º \u{1F321}
            \nTemperature feels like #{weather.feels}º
            \n___________
            \nHumidity #{weather.humidity}%
            \nPressure #{weather.pressure}mb
            \nVisibility #{weather.visibility.visibility_range}
            \n___________
            \n Cloudiness #{weather.cloudiness.to_i}% \u{2601}
            \n \u{1F32C}  Wind #{weather.wind_speed} #{weather.wind_deg.graph_cond.bold.colorize(:cyan)}" 
          end 
          print box
          puts ''
          puts  "QUOTE OF THE DAY... Brought you BY the Authentic Weather App" 
          puts ''
          puts "#{weather.description.quotes}"
          puts ''
    end 


    def weather_location(weather1)

        puts ''
        puts "Today in #{weather1.location}"

          box = TTY::Box.frame(width: 37, height: 24, border: :light, align: :center, padding: [1,3]) do
            "#{weather1.description.graph_cond}  #{weather1.description.upcase.bold.colorize(:white)} 
            \n#{weather1.temp.to_s.upcase.bold}º
            \nL:#{weather1.temp_min}º H:#{weather1.temp_max}º \u{1F321} 
            \nTemperature feels like #{weather1.feels}º
            \n___________
            \nHumidity #{weather1.humidity}%
            \nPressure #{weather1.pressure}mb
            \nVisibility #{weather1.visibility.visibility_range}
            \n___________
            \n Cloudiness #{weather1.cloudiness.to_i}% \u{2601}
            \n \u{1F32C}  Wind #{weather1.wind_speed} #{weather1.wind_deg.graph_cond.bold.colorize(:cyan)}" 
          end 
          print box
          puts ''    
    end

    def weather_enquire(weather_location_time)
        puts ''
        p "THE WEATHER IN #{weather_location_time.location}"
        puts ''
        p "Local time: #{weather_location_time.time}"
    end 


    def display_forecast(forecast)
       forecast_table_1 = TTY::Table.new(["Next Hour","#{forecast.dt_1}","#{forecast.dt_2}","#{forecast.dt_3}","#{forecast.dt_4}","#{forecast.dt_5}"], 
                                         [["#{forecast.weather.graph_cond}","#{forecast.weather_1.graph_cond}","#{forecast.weather_2.graph_cond}","#{forecast.weather_3.graph_cond}","#{forecast.weather_4.graph_cond}","#{forecast.weather_5.graph_cond}"],
                                         ["#{forecast.temp}º","#{forecast.temp_1}º","#{forecast.temp_2}º","#{forecast.temp_3}º","#{forecast.temp_4}º","#{forecast.temp_5}º"],
                                         ["#{forecast.humidity}%","#{forecast.humidity_1}%","#{forecast.humidity_2}%","#{forecast.humidity_3}%","#{forecast.humidity_4}%","#{forecast.humidity_5}%"],
                                         ["#{forecast.pop_1.to_i}%\u{1F4A7}","#{forecast.pop.to_i}%\u{1F4A7}","#{forecast.pop_2.to_i}%\u{1F4A7}","#{forecast.pop_3.to_i}%\u{1F4A7}","#{forecast.pop_4.to_i}%\u{1F4A7}","#{forecast.pop_5.to_i}%\u{1F4A7}"],
                                         ["#{forecast.uvi.uv_radiation}","#{forecast.uvi_1.uv_radiation}","#{forecast.uvi_2.uv_radiation}","#{forecast.uvi_3.uv_radiation}","#{forecast.uvi_4.uv_radiation}","#{forecast.uvi_5.uv_radiation}"]])
        
        puts forecast_table_1.render(:unicode, padding: [1, 2], alignments: [:center, :center, :center, :center, :center, :center]) { |renderer|
        renderer.border.style = :blue
      }   
    end

    def display_forecast2(forecast_2)
        forecast_table_2 = TTY::Table.new(["Next Hour","#{forecast_2.dt_1}","#{forecast_2.dt_2}","#{forecast_2.dt_3}","#{forecast_2.dt_4}","#{forecast_2.dt_5}"], 
                                         [["#{forecast_2.weather.graph_cond}","#{forecast_2.weather_1.graph_cond}","#{forecast_2.weather_2.graph_cond}","#{forecast_2.weather_3.graph_cond}","#{forecast_2.weather_4.graph_cond}","#{forecast_2.weather_5.graph_cond}"],
                                         ["#{forecast_2.temp}º","#{forecast_2.temp_1}º","#{forecast_2.temp_2}º","#{forecast_2.temp_3}º","#{forecast_2.temp_4}º","#{forecast_2.temp_5}º"],
                                         ["#{forecast_2.humidity}%","#{forecast_2.humidity_1}%","#{forecast_2.humidity_2}%","#{forecast_2.humidity_3}%","#{forecast_2.humidity_4}%","#{forecast_2.humidity_5}%"],
                                         ["#{forecast_2.pop_1.to_i}%\u{1F4A7}","#{forecast_2.pop.to_i}%\u{1F4A7}","#{forecast_2.pop_2.to_i}%\u{1F4A7}","#{forecast_2.pop_3.to_i}%\u{1F4A7}","#{forecast_2.pop_4.to_i}%\u{1F4A7}","#{forecast_2.pop_5.to_i}%\u{1F4A7}"]])
        
        puts forecast_table_2.render(:unicode, padding: [1, 2], alignments: [:center, :center, :center, :center, :center, :center]) { |renderer|
        renderer.border.style = :red
      }    
     end

     def news_feed_(news)

        box = TTY::Box.frame(width: 90, height: 8, border: :light, align: :left, padding: [1,3], title: {top_left: "(Headlines)", bottom_right: "(Source:BBC World)"}) do
            "- #{news.title_1}  \n- #{news.title_2} \n- #{news.title_3}  \n- #{news.title_4}"
        end 

        print box
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
           menu_2
       end
    end 
  

    def bye
        puts Paint[ 'Thanks for checking the weather. Get ready to go out', :cyan, :italic]
        puts "  
                                                                                                                                                         
                                                                   dddddddd     bbbbbbbb                                                              
        GGGGGGGGGGGGG                                              d::::::d     b::::::b                                                              
     GGG::::::::::::G                                              d::::::d     b::::::b                                                              
   GG:::::::::::::::G                                              d::::::d     b::::::b                                                              
  G:::::GGGGGGGG::::G                                              d:::::d       b:::::b                                                              
 G:::::G       GGGGGG   ooooooooooo      ooooooooooo       ddddddddd:::::d       b:::::bbbbbbbbb    yyyyyyy           yyyyyyy    eeeeeeeeeeee         
G:::::G               oo:::::::::::oo  oo:::::::::::oo   dd::::::::::::::d       b::::::::::::::bb   y:::::y         y:::::y   ee::::::::::::ee       
G:::::G              o:::::::::::::::oo:::::::::::::::o d::::::::::::::::d       b::::::::::::::::b   y:::::y       y:::::y   e::::::eeeee:::::ee     
G:::::G    GGGGGGGGGGo:::::ooooo:::::oo:::::ooooo:::::od:::::::ddddd:::::d       b:::::bbbbb:::::::b   y:::::y     y:::::y   e::::::e     e:::::e     
G:::::G    G::::::::Go::::o     o::::oo::::o     o::::od::::::d    d:::::d       b:::::b    b::::::b    y:::::y   y:::::y    e:::::::eeeee::::::e     
G:::::G    GGGGG::::Go::::o     o::::oo::::o     o::::od:::::d     d:::::d       b:::::b     b:::::b     y:::::y y:::::y     e:::::::::::::::::e      
G:::::G        G::::Go::::o     o::::oo::::o     o::::od:::::d     d:::::d       b:::::b     b:::::b      y:::::y:::::y      e::::::eeeeeeeeeee       
 G:::::G       G::::Go::::o     o::::oo::::o     o::::od:::::d     d:::::d       b:::::b     b:::::b       y:::::::::y       e:::::::e                
  G:::::GGGGGGGG::::Go:::::ooooo:::::oo:::::ooooo:::::od::::::ddddd::::::dd      b:::::bbbbbb::::::b        y:::::::y        e::::::::e               
   GG:::::::::::::::Go:::::::::::::::oo:::::::::::::::o d:::::::::::::::::d      b::::::::::::::::b          y:::::y          e::::::::eeeeeeee       
     GGG::::::GGG:::G oo:::::::::::oo  oo:::::::::::oo   d:::::::::ddd::::d      b:::::::::::::::b          y:::::y            ee:::::::::::::e       
        GGGGGG   GGGG   ooooooooooo      ooooooooooo      ddddddddd   ddddd      bbbbbbbbbbbbbbbb          y:::::y               eeeeeeeeeeeeee       
                                                                                                          y:::::y                                     
                                                                                                         y:::::y                                      
                                                                                                        y:::::y                                       
                                                                                                       y:::::y                                        
                                                                                                      yyyyyyy                                         
                                                                                                                                                      
                                                                                                                                                                 
        ".colorize(:red)
        exit 
    end     
end