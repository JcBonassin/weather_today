class WeatherToday::Weather

    attr_accessor :location, :date, :temp, :decription, :forecast, :temp_min, :temp_max, :conditions, :city, :day_1, :time 
    

    include HTTParty
    base_uri "api.openweathermap.org/data/2.5"

    def self.location
        url = URI("https://freegeoip.app/json/")
        http = Net::HTTP.new(url.host, url.port)
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE
        request = Net::HTTP::Get.new(url)   
        request["accept"] = 'application/json'
        request["content-type"] = 'application/json'
        response = http.request(request)
        data = JSON.parse(response.body, symbolize_names: true)
        #data.fetch_values(:latitude, :longitude, :city)
        location = data.fetch(:city)
        #[@location]

    end 

    def self.lat
        url = URI("https://freegeoip.app/json/")
        http = Net::HTTP.new(url.host, url.port)
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE
        request = Net::HTTP::Get.new(url)   
        request["accept"] = 'application/json'
        request["content-type"] = 'application/json'
        response = http.request(request)
        data = JSON.parse(response.body, symbolize_names: true)
        @lat = data.fetch(:latitude)
    end 

    def self.lon
        url = URI("https://freegeoip.app/json/")
        http = Net::HTTP.new(url.host, url.port)
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE
        request = Net::HTTP::Get.new(url)   
        request["accept"] = 'application/json'
        request["content-type"] = 'application/json'
        response = http.request(request)
        data = JSON.parse(response.body, symbolize_names: true)
        @lon = data.fetch(:longitude)
    end 

    #def self.current_time
    #    response = HTTParty.get("https://timezoneapi.io/api/ip/?token=aJvkeBPLCzkvwFKeMmTa")
    #    parsed = response.parsed_response
    #    if parsed["meta"]["code"] = 200
    #        city = parsed["data"]["city"]
    #        puts city
    #        time = parsed["data"]["datetime"]["date_time"]
    #        puts time
    #    end
    #end


    def self.api_location
        response = HTTParty.get("http://api.openweathermap.org/data/2.5/weather?q=#{location}&appid=#{ENV['API_KEY']}&units=imperial")
        data = JSON.parse(response.body, symbolize_names: true)
        @weather_today = self.new
        @weather_today.location = data[:name]
        @weather_today.date = Time.at(data[:dt])
        @weather_today.time = Time.new(data[:timezone])
        @weather_today.temp = data[:main][:temp]
        @weather_today.decription = data[:weather].first[:description]
        [@weather_today]
    end 

    

   def self.api_forecast
       response = HTTParty.get("https://api.openweathermap.org/data/2.5/onecall?lat=#{lat}&lon=#{lon}&exclude=minutely,hourly,current&appid=#{ENV['API_KEY']}&units=imperial")
       data = JSON.parse(response.read_body, symbolize_names: true)
       #parsed = response.parsed_response
       #data.select {|key,_| data.include? key}
       @forecast = self.new 
       @forecast.day_1 = data[:daily][0][:wind_speed]
       #@forecast.day_2 = parsed["daily"][2]["temp"]
       #@forecast.report_time = parsed["dt"]
       #@forecast.day = Time.at(data[:dt]).strftime('%H:%M %d-%m-%Y')
       #data = JSON.parse(response.body, symbolize_names: true)
       #@forecast.temp_min = data[:daily]
       #@forecast = self.new
       @forecast.location = data[:name]
       #@forecast.temp_min = data[:main]
       #forecast.temp_max = "temp_max"
       #forecast.conditions = "conditions"
       #@forecast.description = data[:weather][:description]

       [@forecast]
   end

   #def self.daily_forecast
   #     data.map do |w|
   #         w.select {|k,_| api_forecast.include? k}
   #     end
   #end 

   #def self.today
    #    self.api_data
    #end 
    #
    #def self.api_data
    #    response = HTTParty.get('http://api.openweathermap.org/data/2.5/weather?q=chicago,us&appid=f8822bf698b7ae0e71f06a474dc913f3&units=imperial')
    #    data = JSON.parse(response.body, symbolize_names: true)
    #    @weather_today = self.new
    #    @weather_today.location = data[:name]
    #    @weather_today.date = Time.at(data[:dt]).strftime('%d-%m-%Y %H:%M')
    #    @weather_today.temp = data[:main][:temp]
    #    @weather_today.decription = data[:weather].first[:description]
    #    [@weather_today]
    #end 

    
    
    


       ## weather_today = self.new
       #     puts weather_today.today
       
        #self.api_weather
        #return all the data from the API
        #puts <<-DOC
        #    my location
        #    date
        #    temp
        #    decription
        #DOC

        #weather_today = self.new
        #weather_today.location = "location"
        #weather_today.date = "date"
        #weather_today.temp = "temp"
        #weather_today.decription = "description"

     #[weather_today]
    #end 

   # def self.api_weather
   #     weather_today = []
   #     weather_today << self.api_weather
   #     self.class.get('/weather?q=london,uk&appid=f8822bf698b7ae0e71f06a474dc913f3')
   # end
   #     weather_today
   # end 

end 

