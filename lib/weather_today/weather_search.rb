class WeatherToday::Search

    attr_accessor :location, :temp, :date, :conditions, :time, :current_time, :city, :response_code, :temp_max

    
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
       @current.temp = data[:main][:temp]
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
       @location_time
       
   end


  #def self.select_name(location)
  #  options = { units: "metric", APPID: "f8822bf698b7ae0e71f06a474dc913f3" }
  #  OpenWeather::Current.city(location, options) 
  # 

  #end 

end 
