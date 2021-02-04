class WeatherToday::Weather

    def self.today
        #return all the data from the API
        puts <<-DOC
            my location
            date
            temp
            decription
        DOC
    end 

    weather_today = self.new
    weather_today.location = "my location"
    weather_today.date = "today's date"
    weather_today.temp = "temperature"
    weather_today.decription = "descrription"
    

end 