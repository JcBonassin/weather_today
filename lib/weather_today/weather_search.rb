class WeatherToday::Search

    attr_accessor :location, :temp, :date, :conditions, :time, :current_time, :city, :response_code, :temp_max


   def self.select_name(location)
        response = HTTParty.get("http://api.openweathermap.org/data/2.5/weather?q=#{location}&appid=f8822bf698b7ae0e71f06a474dc913f3&units=imperial")
        data = JSON.parse(response.body, symbolize_names: true)
        #parsed = response.parsed_response
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
        response = HTTParty.get("https://timezone.abstractapi.com/v1/current_time?api_key=77073b8cd87e4f05a9f064ed0c6855ee&location=#{location}")
        parsed = response.parsed_response  
        @location_time = self.new
        @location_time.time = parsed["datetime"]
        @location_time
        
    end


end 
