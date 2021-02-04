class WeatherToday::CLI

    def call
        welcome
        menu
        #forecast
        #bye
    end
    
    def welcome
        puts "welcome to today's weather"
        @weather = WeatherToday::Weather.today
    end
        
    
    def menu
        input = nil
        while input != "q"
            puts "
            Please select: 

            f for forecast 
            u for more useful data
            m for main menu
            c to check another city
            q to exit "   
            input = gets.chomp
            case input
            when "f"
                forecast
            when "u"
                puts "useful date"
            when "m"
                welcome    
            when "q" 
                bye  
            else puts "sorry you didn't select the right option. Please try again"        
            end
        end 
    end   
    
    
   def forecast
       puts <<-DOC
            temp_min
            temp_max
            Conditions
        DOC
    end

    def bye
        puts "thanks for checking the weather. Get ready to go out"
    end     


end