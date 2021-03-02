class WeatherToday::Weather

    attr_accessor :location, :date, :temp, :decription, :forecast, :temp_min, :temp_max, :feels, :all_news
    attr_accessor :conditions, :city, :temp_1, :temp_2, :temp_3, :dt_1, :dt_2, :dt_3 
    attr_accessor :title_1, :title_2, :title_3, :title_4, :url_1, :url_2, :url_3, :url_4
    attr_accessor :weather_1, :weather_2, :weather_3, :humidity_1, :humidity_2, :humidity_3 
    

   # def self.location
   #     url = URI("https://freegeoip.app/json/")
   #     http = Net::HTTP.new(url.host, url.port)
   #     http.use_ssl = true
   #     http.verify_mode = OpenSSL::SSL::VERIFY_NONE
   #     request = Net::HTTP::Get.new(url)   
   #     request["accept"] = 'application/json'
   #     request["content-type"] = 'application/json'
   #     response = http.request(request)
   #     data = JSON.parse(response.body, symbolize_names: true)
   #     #data.fetch_values(:latitude, :longitude, :city)
   #     location = data.fetch(:city)
   #     #[@location]
#
   # end 

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
        lat = data.fetch(:latitude)
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
        lon = data.fetch(:longitude)
    end 

    #def self.current_time
    #    response = HTTParty.get("https://timezoneapi.io/api/ip/?token=aJvkeBPLCzkvwFKeMmTa")
    #    parsed = response.parsed_response
    #    if parsed["meta"]["code"] = 200
    #        #city = parsed["data"]["city"]
    #        #puts city
    #        time = parsed["data"]["datetime"]["date_time"]
    #        puts time
    #    end
#
    #end


    def self.api_location
        response = HTTParty.get("https://api.openweathermap.org/data/2.5/weather?lat=#{lat}&lon=#{lon}&appid=#{ENV['API_KEY']}&units=imperial")
        data = JSON.parse(response.body, symbolize_names: true)
        @weather_today = self.new
        @weather_today.location = data[:name]
        #@weather_today.date = Time.at(data[:dt]).strftime('Today: %A %d-%m-%Y') # only time report not local time
        #@weather_today.time = Time.new(data[:timezone])
        @weather_today.temp = data[:main][:temp]
        @weather_today.decription = data[:weather].first[:description]
        @weather_today.temp_max = data[:main][:temp_max]
        @weather_today.temp_min = data[:main][:temp_min]
        @weather_today.feels = data[:main][:feels_like]
        @weather_today
    end 

    

   def self.api_forecast
       response = HTTParty.get("https://api.openweathermap.org/data/2.5/onecall?lat=#{lat}&lon=#{lon}&exclude=minutely,hourly,current&appid=#{ENV['API_KEY']}&units=imperial")
       data = JSON.parse(response.read_body, symbolize_names: true)
       #parsed = response.parsed_response
       @forecast = self.new 
       @forecast.temp_1 = data[:daily][1][:temp][:day]
       @forecast.temp_2 = data[:daily][2][:temp][:day]
       @forecast.temp_3 = data[:daily][3][:temp][:day]
       #@forecast.report_time = parsed["dt"]
       @forecast.dt_1 = Time.at(data[:daily][1][:dt]) .strftime('%A')
       @forecast.dt_2 = Time.at(data[:daily][2][:dt]).strftime('%A')
       @forecast.dt_3 = Time.at(data[:daily][3][:dt]).strftime('%A')
       #data = JSON.parse(response.body, symbolize_names: true)

       @forecast.weather_1 = data[:daily][1][:weather].first[:description]
       @forecast.weather_2 = data[:daily][2][:weather].first[:description]
       @forecast.weather_3 = data[:daily][3][:weather].first[:description]

       @forecast.humidity_1 = data[:daily][1][:humidity]
       @forecast.humidity_2 = data[:daily][2][:humidity]
       @forecast.humidity_3 = data[:daily][3][:humidity]
       #@forecast.temp_min = data[:daily]
       #@forecast = self.new
       #@forecast.location = data[:name]
       #@forecast.temp_min = data[:main]
       #forecast.temp_max = "temp_max"
       #forecast.conditions = "conditions"
       #@forecast.description = data[:current][:weather][:description]

       @forecast
   end


   def self.news 
    response = HTTParty.get("https://newsapi.org/v2/top-headlines?sources=bbc-news&apiKey=647fbe72d746415bb1d9e2110f0e9b43")
    data = JSON.parse(response.read_body, symbolize_names: true)
    @news = self.new 
    @news.title_1 = data[:articles][0][:title]
    @news.url_1 = data[:articles][0][:url]
    @news.title_2 = data[:articles][1][:title]
    @news.url_2 = data[:articles][1][:url]
    @news.title_3 = data[:articles][2][:title]
    @news.url_3 = data[:articles][2][:url]
    @news.title_4 = data[:articles][3][:title]
    @news.url_4 = data[:articles][3][:url]
    @news.title_4 = data[:articles][4][:title]
    @news.url_4 = data[:articles][4][:url]
    link = @news
    #@news.all_news = n.get_top_headlines(sources: "bbc-news")
    #all = @news.all_news
    #@news.title_1 = all[0]
    
   @news
   end 

   def self.open_link
    link = "https://www.bbc.com/news/world"
    if RbConfig::CONFIG['host_os'] =~ /mswin|mingw|cygwin/
      system "start #{link}"
    elsif RbConfig::CONFIG['host_os'] =~ /darwin/
      system "open #{link}"
    elsif RbConfig::CONFIG['host_os'] =~ /linux|bsd/
      system "xdg-open #{link}"
    end
  end


end 

