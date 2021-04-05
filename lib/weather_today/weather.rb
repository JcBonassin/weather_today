
class WeatherToday::Weather < Helper

    attr_accessor :location, :date, :temp, :description, :forecast, :temp_min, :temp_max, :feels, :all_news, :time
    attr_accessor :conditions, :city, :temp_1, :temp_2, :temp_3, :temp_4, :temp_5, :dt, :dt_1, :dt_2, :dt_3, :dt_4, :dt_5 
    attr_accessor :title_1, :title_2, :title_3, :title_4, :url_1, :url_2, :url_3, :url_4, :uvi, :uvi_1, :uvi_2, :uvi_3, :uvi_4, :uvi_5
    attr_accessor :weather, :weather_1, :weather_2, :weather_3, :weather_4, :weather_5, :pressure 
    attr_accessor :sunset, :sunrise, :pop, :pop_1, :pop_2, :pop_3, :pop_4, :pop_5, :cloudiness, :wind_speed, :wind_deg
    attr_accessor :humidity, :humidity_1, :humidity_2, :humidity_3, :humidity_4, :humidity_5, :visibility
    
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

    def self.api_location(unit)
        response = HTTParty.get("https://api.openweathermap.org/data/2.5/weather?lat=#{lat}&lon=#{lon}&appid=#{ENV['API_KEY']}&units=#{unit}")
        data = JSON.parse(response.body, symbolize_names: true)
        @weather_today = self.new
        @weather_today.location = data[:name]
        @weather_today.time = Time.at(data[:dt])
        @weather_today.temp = data[:main][:temp].to_i
        @weather_today.description = data[:weather].first[:description]
        @weather_today.temp_max = data[:main][:temp_max].to_i
        @weather_today.temp_min = data[:main][:temp_min].to_i
        @weather_today.feels = data[:main][:feels_like].to_i
        @weather_today.humidity = data[:main][:humidity]
        @weather_today.pressure = data[:main][:pressure]
        @weather_today.sunset = Time.at(data[:sys][:sunset]).strftime('%H:%M')
        @weather_today.sunrise = Time.at(data[:sys][:sunrise]).strftime('%H:%M')
        @weather_today.visibility = data[:visibility]
        @weather_today.cloudiness = data[:clouds][:all]
        @weather_today.wind_speed = data[:wind][:speed]
        @weather_today.wind_deg = compass(data[:wind][:deg])
        @weather_today
    end 


   def self.api_forecast(unit)
       response = HTTParty.get("https://api.openweathermap.org/data/2.5/onecall?lat=#{lat}&lon=#{lon}&exclude=minutely,current&appid=#{ENV['API_KEY']}&units=#{unit}")
       data = JSON.parse(response.read_body, symbolize_names: true)
       @forecast = self.new 
       @forecast.temp = data[:hourly][1][:temp].to_i
       @forecast.temp_1 = data[:daily][1][:temp][:day].to_i
       @forecast.temp_2 = data[:daily][2][:temp][:day].to_i
       @forecast.temp_3 = data[:daily][3][:temp][:day].to_i
       @forecast.temp_4 = data[:daily][4][:temp][:day].to_i
       @forecast.temp_5 = data[:daily][5][:temp][:day].to_i
       @forecast.dt_1 = Time.at(data[:daily][1][:dt]).strftime('%A')
       @forecast.dt_2 = Time.at(data[:daily][2][:dt]).strftime('%A')
       @forecast.dt_3 = Time.at(data[:daily][3][:dt]).strftime('%A')
       @forecast.dt_4 = Time.at(data[:daily][4][:dt]).strftime('%A')
       @forecast.dt_5 = Time.at(data[:daily][5][:dt]).strftime('%A')
       @forecast.weather = data[:hourly][1][:weather].first[:description]
       @forecast.weather_1 = data[:daily][1][:weather].first[:description]
       @forecast.weather_2 = data[:daily][2][:weather].first[:description]
       @forecast.weather_3 = data[:daily][3][:weather].first[:description]
       @forecast.weather_4 = data[:daily][4][:weather].first[:description]
       @forecast.weather_5 = data[:daily][5][:weather].first[:description]
       @forecast.humidity = data[:hourly][1][:humidity]
       @forecast.humidity_1 = data[:daily][1][:humidity]
       @forecast.humidity_2 = data[:daily][2][:humidity]
       @forecast.humidity_3 = data[:daily][3][:humidity]
       @forecast.humidity_4 = data[:daily][4][:humidity]
       @forecast.humidity_5 = data[:daily][5][:humidity]
       @forecast.pop_1 = data[:hourly][1][:pop]*100
       @forecast.pop = data[:daily][1][:pop]*100
       @forecast.pop_2 = data[:daily][2][:pop]*100
       @forecast.pop_3 = data[:daily][3][:pop]*100
       @forecast.pop_4 = data[:daily][4][:pop]*100
       @forecast.pop_5 = data[:daily][5][:pop]*10
       @forecast.uvi = data[:hourly][1][:uvi].to_i
       @forecast.uvi_1 = data[:daily][1][:uvi].to_i
       @forecast.uvi_2 = data[:daily][2][:uvi].to_i
       @forecast.uvi_3 = data[:daily][3][:uvi].to_i
       @forecast.uvi_4 = data[:daily][4][:uvi].to_i
       @forecast.uvi_5 = data[:daily][5][:uvi].to_i
       @forecast
   end


   def self.news 
    response = HTTParty.get("https://newsapi.org/v2/top-headlines?sources=bbc-news&apiKey=#{ENV['API_NEWS']}")
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
    @link = @news.url_1
    @link_2 = @news.url_2
    @link_3 = @news.url_3
    @link_4 = @news.url_4
    @news 
   end 
end 

