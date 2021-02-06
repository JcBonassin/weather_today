class WeatherToday::Weather

    attr_accessor :location, :date, :temp, :decription


    def self.today
        #return all the data from the API
        #puts <<-DOC
        #    my location
        #    date
        #    temp
        #    decription
        #DOC

        weather_today = self.new
        weather_today.location = "location"
        weather_today.date = "date"
        weather_today.temp = "temp"
        weather_today.decription = "description"

     [weather_today]
    end 
end 