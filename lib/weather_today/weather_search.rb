
class WeatherToday::Search

 
    attr_accessor :location, :temp, :date, :conditions, :time, :current_time, :city, :response_code, :description, :humidity

    attr_accessor :temp_max, :temp_min, :temp_1, :temp_2, :temp_3, :temp_4, :dt_1, :dt_2, :dt_3, :dt_4, :humidity_1, :humidity_2, :humidity_3, :humidity_4

    attr_accessor :weather_1, :weather_2 , :weather_3, :weather_4, :pop, :pop_2, :pop_3, :pop_4

    
    
 def self.select_name(location)
      response = HTTParty.get("http://api.openweathermap.org/data/2.5/weather?q=#{location}&appid=#{ENV['API_KEY']}&units=imperial")
      data = JSON.parse(response.body, symbolize_names: true)
      #data = response.parsed_response
      @current = self.new
      @current.response_code = data[:cod]
      if @current.response_code === "404"
          puts "Invalid location"
          return
      else
      @current.date = Time.at(data[:dt]).strftime('%H:%M %d-%m-%Y')
      @current.temp = data[:main][:temp].to_i
      @current.conditions = data[:weather].first[:description]
      @current.temp_max = data[:main][:temp]
      end 
      @current
  end 


  def self.current_time(location)
      response = HTTParty.get("https://timezone.abstractapi.com/v1/current_time?api_key=#{ENV['API_ABSTRACT']}&location=#{location}")
      data = JSON.parse(response.body, symbolize_names: true)
      #parsed = response.parsed_response  
      @location_time = self.new
      @location_time.time = data[:datetime]
      #@location_time.time = data[:countryCode]
      @location_time
      
  end

   #A ruby wrapper for Open Weather Map API.
   #def self.select_name(location)
   # options = { units: "metric", APPID: "f8822bf698b7ae0e71f06a474dc913f3" }
   # OpenWeather::Current.city(location, options) 
   #
   # end 


   
  def self.select_forecast(location)
    response = HTTParty.get("https://api.openweathermap.org/data/2.5/forecast?q=#{location}&appid=#{ENV['API_KEY']}&units=imperial")
    data = JSON.parse(response.read_body, symbolize_names: true)
    #parsed = response.parsed_response
    @forecast_1 = self.new 
    @forecast_1.temp_1 = data[:list][8][:main][:temp].to_i
    @forecast_1.temp_2 = data[:list][16][:main][:temp].to_i
    @forecast_1.temp_3 = data[:list][24][:main][:temp].to_i
    @forecast_1.temp_4 = data[:list][32][:main][:temp].to_i
    #@forecast_1.report_time = parsed["dt"]
    @forecast_1.dt_1 = Time.at(data[:list][8][:dt]).strftime('%A') #('%d-%m-%Y')
    @forecast_1.dt_2 = Time.at(data[:list][16][:dt]).strftime('%A') #('%d-%m-%Y')
    @forecast_1.dt_3 = Time.at(data[:list][24][:dt]).strftime('%A') #('%d-%m-%Y')
    @forecast_1.dt_4 = Time.at(data[:list][32][:dt]).strftime('%A') #('%d-%m-%Y')
    
    @forecast_1.weather_1 = data[:list][8][:weather].first[:description]
    @forecast_1.weather_2 = data[:list][16][:weather].first[:description]
    @forecast_1.weather_3 = data[:list][24][:weather].first[:description]
    @forecast_1.weather_4 = data[:list][32][:weather].first[:description]

    @forecast_1.humidity_1 = data[:list][8][:main][:humidity]
    @forecast_1.humidity_2 = data[:list][16][:main][:humidity]
    @forecast_1.humidity_3 = data[:list][24][:main][:humidity]
    @forecast_1.humidity_4 = data[:list][32][:main][:humidity]

    @forecast_1.pop = data[:list][8][:pop]*100
    @forecast_1.pop_2 = data[:list][16][:pop]*100
    @forecast_1.pop_3 = data[:list][24][:pop]*100
    @forecast_1.pop_4 = data[:list][32][:pop]*100
    #@forecast.temp_min = data[:daily]
    #@forecast = self.new
    #@forecast.location = data[:name]
    #@forecast.temp_min = data[:main]
    #forecast.temp_max = "temp_max"
    #forecast.conditions = "conditions"
    #@forecast.description = data[:current][:weather][:description]

    @forecast_1
  end


    
end







  


