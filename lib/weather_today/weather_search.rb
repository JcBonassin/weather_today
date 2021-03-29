
class WeatherToday::Search

 
    attr_accessor :location, :temp, :date, :conditions, :time, :current_time, :city, :response_code, :description, :humidity, :coord, :feels, :pressure

    attr_accessor :temp_max, :temp_min, :temp_1, :temp_2, :temp_3, :temp_4, :temp_5, :dt, :dt_1, :dt_2, :dt_3, :dt_4, :dt_5, :humidity, :humidity_1, :humidity_2, :humidity_3, :humidity_4, :humidity_5

    attr_accessor :weather, :weather_1, :weather_2 , :weather_3, :weather_4, :weather_5, :pop, :pop_1, :pop_2, :pop_3, :pop_4, :pop_5, :visibility, :units

    attr_accessor :sunset, :sunrise, :visibility, :cloudiness, :wind_speed, :wind_deg, :uvi, :uvi_1, :uvi_2, :uvi_3, :uvi_4, :uvi_5

    
    
 def self.select_name(units, location)
      #response = HTTParty.get("http://api.openweathermap.org/data/2.5/weather?q=tokyo&appid=f8822bf698b7ae0e71f06a474dc913f3&units=imperial")
      response = HTTParty.get("http://api.openweathermap.org/data/2.5/weather?q=#{location}&appid=#{ENV['API_KEY']}&units=#{units}")
      data = JSON.parse(response.body, symbolize_names: true)
      #data = response.parsed_response
      @weather_today = self.new
      @weather_today.response_code = data[:cod]
      if @weather_today.response_code === "404"
        spinner = TTY::Spinner.new("[:spinner] cod")
        spinner.error("404")
        return
      else
      @weather_today.location = data[:name]
      @weather_today.date = Time.at(data[:dt]).strftime('%H:%M %d-%m-%Y')
      @weather_today.temp = data[:main][:temp].to_i
      @weather_today.conditions = data[:weather].first[:description]
      @weather_today.visibility = data[:visibility].to_s
      @weather_today.coord = data[:coord].values.reverse.join(", ")
      @weather_today.description = data[:weather].first[:description]
      @weather_today.temp_max = data[:main][:temp_max].to_i
      @weather_today.temp_min = data[:main][:temp_min].to_i
      @weather_today.feels = data[:main][:feels_like].to_i
      @weather_today.humidity = data[:main][:humidity]
      @weather_today.pressure = data[:main][:pressure]
      #@weather_today.sunset = Time.at(data[:sys][:sunset]).strftime('%H:%M')
      #@weather_today.sunrise = Time.at(data[:sys][:sunrise]).strftime('%H:%M')
      @weather_today.visibility = data[:visibility]
      @weather_today.cloudiness = data[:clouds][:all]
      @weather_today.wind_speed = data[:wind][:speed]
      @weather_today.wind_deg = degToCompass(data[:wind][:deg])

     # @weather_today.maps = "https://www.google.com/maps/place/#{@weather_today.coordinates.gsub(" ", "")}"
      #@map = @weather_today.maps
      end 
      @weather_today
  end 


  def self.current_time(location)
      #response = HTTParty.get("https://timezone.abstractapi.com/v1/current_time?api_key=77073b8cd87e4f05a9f064ed0c6855ee&location=sidney")
      response = HTTParty.get("https://timezone.abstractapi.com/v1/current_time?api_key=#{ENV['API_ABSTRACT']}&location=#{location}")
      data = JSON.parse(response.body, symbolize_names: true)
      #parsed = response.parsed_response  
      @location_time = self.new
      @location_time.time = Time.parse(data[:datetime]).strftime("%A %d-%b-%Y %I:%M %p")    
      @location_time.location = data[:requested_location].upcase  
      @location_time
      
  end

  

   #A ruby wrapper for Open Weather Map API.
   #def self.select_name(location)
   # options = { units: "metric", APPID: "f8822bf698b7ae0e71f06a474dc913f3" }
   # OpenWeather::Current.city(location, options) 
   #
   # end 


   
  def self.select_forecast(units, location)
    #response = HTTParty.get("https://api.openweathermap.org/data/2.5/forecast?q=london&appid=f8822bf698b7ae0e71f06a474dc913f3&units=imperial")
    response = HTTParty.get("https://api.openweathermap.org/data/2.5/forecast?q=#{location}&appid=#{ENV['API_KEY']}&units=#{units}")
    data = JSON.parse(response.read_body, symbolize_names: true)
    #parsed = response.parsed_response
    @forecast_1 = self.new 
    @forecast_1.temp = data[:list][0][:main][:temp].to_i
    @forecast_1.temp_1 = data[:list][3][:main][:temp].to_i
    @forecast_1.temp_2 = data[:list][11][:main][:temp].to_i
    @forecast_1.temp_3 = data[:list][19][:main][:temp].to_i
    @forecast_1.temp_4 = data[:list][27][:main][:temp].to_i
    @forecast_1.temp_5 = data[:list][35][:main][:temp].to_i
    #@forecast_1.dt = Time.at(data[:list][0][:dt]).strftime('%I:%M%P')
    @forecast_1.dt_1 = Time.at(data[:list][3][:dt]).strftime('%A')        # ('%d-%m-%Y-%H:%M')      
    @forecast_1.dt_2 = Time.at(data[:list][11][:dt]).strftime('%A')       # ('%d-%m-%Y-%H:%M')     
    @forecast_1.dt_3 = Time.at(data[:list][19][:dt]).strftime('%A')       # ('%d-%m-%Y-%H:%M')     
    @forecast_1.dt_4 = Time.at(data[:list][27][:dt]).strftime('%A')       # ('%d-%m-%Y-%H:%M')     
    @forecast_1.dt_5 = Time.at(data[:list][35][:dt]).strftime('%A')       # ('%d-%m-%Y-%H:%M')      

    @forecast_1.weather = data[:list][0][:weather].first[:description]
    @forecast_1.weather_1 = data[:list][3][:weather].first[:description]
    @forecast_1.weather_2 = data[:list][11][:weather].first[:description]
    @forecast_1.weather_3 = data[:list][19][:weather].first[:description]
    @forecast_1.weather_4 = data[:list][27][:weather].first[:description]
    @forecast_1.weather_5 = data[:list][35][:weather].first[:description]
    
    @forecast_1.humidity = data[:list][0][:main][:humidity]
    @forecast_1.humidity_1 = data[:list][3][:main][:humidity]
    @forecast_1.humidity_2 = data[:list][11][:main][:humidity]
    @forecast_1.humidity_3 = data[:list][19][:main][:humidity]
    @forecast_1.humidity_4 = data[:list][27][:main][:humidity]
    @forecast_1.humidity_5 = data[:list][35][:main][:humidity]

    @forecast_1.pop_1 = data[:list][0][:pop]*100
    @forecast_1.pop = data[:list][3][:pop]*100
    @forecast_1.pop_2 = data[:list][11][:pop]*100
    @forecast_1.pop_3 = data[:list][19][:pop]*100
    @forecast_1.pop_4 = data[:list][27][:pop]*100
    @forecast_1.pop_5 = data[:list][35][:pop]*100

    @forecast_1.uvi = data[:list][0][:uvi].to_i
    @forecast_1.uvi_1 = data[:list][3][:uvi].to_i
    @forecast_1.uvi_2 = data[:list][11][:uvi].to_i
    @forecast_1.uvi_3 = data[:list][19][:uvi].to_i
    @forecast_1.uvi_4 = data[:list][27][:uvi].to_i
    @forecast_1.uvi_5 = data[:list][35][:uvi].to_i
   #@forecast.temp_min = data[:daily]
    #@forecast = self.new
    #@forecast.location = data[:name]
    #@forecast.temp_min = data[:main]
    #forecast.temp_max = "temp_max"
    #forecast.conditions = "conditions"
    #@forecast.description = data[:current][:weather][:description]

    @forecast_1
  end

  def self.open_link_search
    link = "https://www.google.com/maps/place/#{@weather_today.coord.gsub(" ", "")}"
    if RbConfig::CONFIG['host_os'] =~ /mswin|mingw|cygwin/
      system "start #{link}"
    elsif RbConfig::CONFIG['host_os'] =~ /darwin/
      system "open #{link}"
    elsif RbConfig::CONFIG['host_os'] =~ /linux|bsd/
      system "xdg-open #{link}"
    end
  end

  def self.degToCompass(deg)
    val = ((deg.to_f / 22.5) + 0.5).floor
    direction_arr = ["N", "NNE", "NE", "ENE", "E", "ESE", "SE", "SSE", "S", "SSW", "SW", "WSW", "W", "WNW", "NW", "NNW"]
    return direction_arr[(val % 16)]
  end


    
end







  


