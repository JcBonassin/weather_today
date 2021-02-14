class WeatherToday::Search

    attr_accessor :name, :temp, :location, :date, :conditions

    #@@names = []

    #def initialize 
    #    @name = name
    #    @@names << self 
    #end 

  #def self.name
  #  @names
  #end


   def self.select_name(name)
        response = HTTParty.get("http://api.openweathermap.org/data/2.5/weather?q=#{name}&appid=f8822bf698b7ae0e71f06a474dc913f3&units=imperial")
        #data = JSON.parse(response.body, symbolize_names: true)
        parsed = response.parsed_response
        @current = self.new
        @current.date = Time.at(parsed["dt"]).strftime('%H:%M %d-%m-%Y')
        @current.temp = parsed["main"]["temp"]
        @current.conditions = parsed["weather"].first["description"]
        #@current.temp_max = parsed["main"]["temp"]
        @current
    end 
end 
