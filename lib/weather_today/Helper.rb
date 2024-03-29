class Integer
    def uv_radiation
        inf = Float::INFINITY
        case self
        when 0..2
            "L UV"
        when 3..5 
             "M UV"
        when 6..7
           "H UV"
        when 8..10  
           "VH UV"
        when 11..inf
           "E UV"
        else 
            "Error UV"
        end
    end  

   def visibility_range
      case self  
      when 0..999
           "Fog"
      when 1000..5000
          "Poor"
      when 5001..9999
          "Moderate"
      when 10000
           "Good"
      else 
          "Clear"
      end 
    end 
end 

class String
  def graph_cond
      case self
      when 'thunderstorm'
          "\u{26C8}" 
      when 'thunderstorm with light rain'
          "\u{26C8}" 
      when 'thunderstorm with rain'
          "\u{26C8}" 
      when 'thunderstorm with heavy rain'
          "\u{26C8}" 
      when 'light thunderstorm'
          "\u{26C8}" 
      when 'ragged thunderstorm'
          "\u{26C8}"   
      when 'thunderstorm with light drizzle'
          "\u{26C8}"   
      when 'thunderstorm with drizzle'
          "\u{26C8}"   
      when 'light thunderstorm'
          "\u{26C8}"   
      when 'thunderstorm with heavy drizzle'
          "\u{26C8}"
      when 'drizzle'
          "\u{1F327}"
      when 'light intensity drizzle'
          "\u{1F327}"
      when 'heavy intensity drizzle'
          "\u{1F327}"
      when 'light intensity drizzle rain'
          "\u{1F327}"
      when 'drizzle rain'
          "\u{1F327}"
      when 'heavy intensity drizzle rain'
          "\u{1F327}"
      when 'shower rain and drizzle'
          "\u{1F327}"
      when 'heavy shower rain and drizzle'
          "\u{1F327}"
      when 'shower drizzle'
          "\u{1F327}" 
      when 'rain'
          "\u{1F326}"
      when 'light rain'
          "\u{1F326}" 
      when 'moderate rain'
          "\u{1F326}" 
      when 'heavy intensity rain'
          "\u{1F326}" 
      when 'very heavy rain'
          "\u{1F326}" 
      when 'extreme rain'
          "\u{1F326}"
      when 'freezing rain'
          "\u{2746}"
      when 'light intensity shower rain'
          "\u{1F327}"  
      when 'shower rain'
          "\u{1F327}"  
      when 'heavy intensity shower rain'
          "\u{1F327}"  
      when 'ragged shower rain'
          "\u{1F327}"    
      when 'snow'
          "\u{2746}"
      when 'light snow'
          "\u{2746}"
      when 'heavy snow'
          "\u{2746}"
      when 'sleet'
          "\u{2746}"
      when 'light shower sleet'
          "\u{2746}"
      when 'shower sleet'
          "\u{2746}"
      when 'light rain and snow'
          "\u{2746}"
      when 'rain and snow'
          "\u{2746}"
      when 'light shower snow'
          "\u{2746}"
      when 'shower snow'
          "\u{2746}"
      when 'heavy shower snow'
          "\u{2746}"
      when 'overcast clouds'
          "\u{2601}" 
      when 'few clouds'
          "\u{26C5}"
      when 'scattered clouds'
          "\u{1F324}"
      when 'broken clouds'
          "\u{1F325}"
      when 'clear sky'
          "\u{1F31E}"
      when 'mist'
          "\u{1F32B}"
      when 'smoke'
          "\u{1F32B}"
      when 'haze'
          "\u{1F32B}"
      when 'sand/ dust whirls'
          "\u{1F32B}"
      when 'fog'
          "\u{1F32B}"
      when 'sand'
          "\u{1F32B}"
      when 'dust'
          "\u{1F32B}"
      when 'volcanic ash'
          "\u{1F30B}"
      when 'squalls'
          "\u{1F32B}"
      when 'tornado'
          "\u{1F32A}"
      when 'cold'
          "\u{2744}"
      when 'hot'
          "\u{1F525}"
      when 'windy'
          "\u{1F32C}"
      when 'hail'
          "\u{1F30A}"
      when "N"
          "\u{2191}" 
      when "S"
          "\u{2193}"
      when "E"
          "\u{2192}"
      when "W"
          "\u{2190}"
      when "WNW"
          "\u{2196}"
      when "NNW"
          "\u{2196}"
      when "NW"
          "\u{2196}"
      when "SSW"
          "\u{2199}"
      when "WSW"
          "\u{2199}"
      when "SW"
          "\u{2199}"
      when "NNE"
          "\u{2197}"
      when "NE"
          "\u{2197}"
      when "ENE"
          "\u{2197}"
      when "ESE"
          "\u{2198}"
      when "SSE"
          "\u{2198}"
      when "SE"
          "\u{2198}" 
      else
          "\u{3F}" 
      end
end
  #Some fun quotes brought you by the Authetic weather App :)    
def quotes 
  case self
    when 'thunderstorm'
         puts "Fucking thunder storm..".bold.blink.colorize(:light_blue)
         puts ''
         puts "It's time to sing the â€œFuck you Thunderâ€.".colorize(:blue)
    when 'thunderstorm with light rain'
         puts "Fucking thunder storm...".bold.blink.colorize(:light_blue)
         puts ''
         puts "It's time to sing the â€œFuck you Thunderâ€.".colorize(:blue) 
    when 'thunderstorm with rain'
         puts "Fucking thunder storm...".bold.blink.colorize(:light_blue)
         puts ''
         puts "It's time to sing the â€œFuck you Thunderâ€.".colorize(:blue)
    when 'thunderstorm with heavy rain'
         puts "Fucking thunder storm...".bold.blink.colorize(:light_blue)
         puts ''
         puts "It's time to sing the â€œFuck you Thunderâ€.".colorize(:blue) 
    when 'light thunderstorm'
         puts "Fucking thunder storm...".bold.blink.colorize(:light_blue)
         puts ''
         puts "It's time to sing the â€œFuck you Thunderâ€.".colorize(:blue) 
    when 'ragged thunderstorm'
         puts "Fucking thunder storm...".bold.blink.colorize(:light_blue)
         puts ''
         puts "It's time to sing the â€œFuck you Thunderâ€.".colorize(:blue)   
    when 'thunderstorm with light drizzle'
         puts "Fucking thunder storm...".bold.blink.colorize(:light_blue)
         puts ''
         puts "It's time to sing the â€œFuck you Thunderâ€.".colorize(:blue)  
    when 'thunderstorm with drizzle'
         puts "Fucking thunder storm...".bold.blink.colorize(:light_blue)
         puts ''
         puts "It's time to sing the â€œFuck you Thunderâ€.".colorize(:blue)   
    when 'light thunderstorm'
         puts "Fucking thunder storm...".bold.blink.colorize(:light_blue)
         puts ''
         puts "It's time to sing the â€œFuck you Thunderâ€.".colorize(:blue)  
    when 'thunderstorm with heavy drizzle'
         puts "Fucking thunder storm...".bold.blink.colorize(:light_blue)
         puts ''
         puts "It's time to sing the â€œFuck you Thunderâ€.".colorize(:blue)
    when 'drizzle'
         puts "Meh... Just stay in bed.".bold.blink.colorize(:light_blue)
         puts ''
         puts "You can browse Tumblr & play Angrybirds.".colorize(:blue)
    when 'light intensity drizzle'
         puts "Global fucking warming".bold.blink.colorize(:light_blue)
         puts ''
         puts "Yeah, let's blame Global Warming.".colorize(:blue)
    when 'heavy intensity drizzle'
         puts "You better get an umbrella my friend.".bold.blink.colorize(:light_blue)
         puts ''
         puts "You can look outside to get more information.".colorize(:blue)
    when 'light intensity drizzle rain'
           puts "You better get an umbrella my friend.".bold.blink.colorize(:light_blue)
           puts ''
           puts "You can look outside to get more information.".colorize(:blue)
    when 'drizzle rain'
         puts "You better get an umbrella my friend.".bold.blink.colorize(:light_blue)
         puts ''
         puts "It rains cats and dogs.".colorize(:blue)
    when 'heavy intensity drizzle rain'
         puts "You better get an umbrella my friend.".bold.blink.colorize(:light_blue)
         puts ''
         puts "It rains cats and dogs.".colorize(:blue)
    when 'shower rain and drizzle'
         puts "You better get an umbrella my friend.".bold.blink.colorize(:light_blue)
         puts ''
         puts "It rains cats and dogs.".colorize(:blue)
    when 'heavy shower rain and drizzle'
         puts "You better get an umbrella my friend.".bold.blink.colorize(:light_blue)
         puts ''
         puts "It rains cats and dogs.".colorize(:blue)
    when 'shower drizzle'
         puts "You better get an umbrella my friend.".bold.blink.colorize(:light_blue)
         puts ''
           puts "It rains cats and dogs.".colorize(:blue)
    when 'rain'
         puts "You better get an umbrella my friend.".bold.blink.colorize(:light_blue)
         puts ''
         puts "It rains cats and dogs.".colorize(:blue)
    when 'light rain'
         puts "You better get an umbrella my friend.".bold.blink.colorize(:light_blue)
         puts ''
         puts "It rains cats and dogs.".colorize(:blue)
    when 'moderate rain'
         puts "Get your fucking umbrella".bold.blink.colorize(:light_blue)
         puts ''
         puts "Shitloads of rain is awaiting you".colorize(:blue)
    when 'heavy intensity rain'
         puts "It rains cats and dogs.".bold.blink.colorize(:light_blue)
         puts ''
         puts "You better get an umbrella my friend.".colorize(:blue) 
    when 'very heavy rain'
         puts "It's fucking raining.".bold.blink.colorize(:light_blue)
         puts ''
         puts "You can look outside to get more information.".colorize(:blue) 
    when 'extreme rain'
         puts "Shitloads of rain is awaiting you".bold.blink.colorize(:light_blue)
         puts ''
         puts "You better get an umbrella my friend.".colorize(:blue)
    when 'freezing rain'
          puts "Fucking brain freeze.".bold.blink.colorize(:light_blue)
          puts ''
          puts "Fuck Yeah Ice Cream!".colorize(:blue)
    when 'light intensity shower rain'
         puts "Get your fucking umbrella".bold.blink.colorize(:light_blue)
         puts ''
         puts "Shitloads of rain is awaiting you.".colorize(:blue) 
    when 'shower rain'
         puts "You better get an umbrella my friend.".bold.blink.colorize(:light_blue)
         puts ''
         puts "Shitloads of rain is awaiting you.".colorize(:blue)  
    when 'heavy intensity shower rain'
         puts "You better get an umbrella my friend.".bold.blink.colorize(:light_blue)
         puts ''
         puts "It rains cats and dogs.".colorize(:blue)  
    when 'ragged shower rain'
         puts "You better get an umbrella my friend.".bold.blink.colorize(:light_blue)
         puts ''
         puts "It rains cats and dogs.".colorize(:blue)    
    when 'snow'
         puts "Holy fucking snow.".bold.blink.colorize(:light_blue)
         puts ''
         puts "Still not ready for building that fucking snow castle.".colorize(:blue)
    when 'light snow'
         puts "Are you freezing fucking serious?".bold.blink.colorize(:light_blue)
         puts ''
         puts "You can't look outside because of fucking snow.".colorize(:blue)
    when 'heavy snow'
          puts "Can't see because fucking snow.".bold.blink.colorize(:light_blue)
          puts ''
          puts "Try looking outside for more information, try it...".colorize(:blue)
    when 'sleet'
         puts "Cold as fucking shit..".bold.blink.colorize(:light_blue)
         puts ''
         puts "You heard it, unpack your space heater!".colorize(:blue)
    when 'light shower sleet'
         puts "It's getting|fucking chilly.".bold.blink.colorize(:light_blue)
         puts ''
          puts "You heard it, unpack your space heater!".colorize(:blue)
    when 'shower sleet'
         puts "Frozen fucking fingers.".bold.blink.colorize(:light_blue)
         puts ''
         puts "Can't feel my fingers any more.".colorize(:blue)
    when 'light rain and snow'
         puts "North fucking pole.".bold.blink.colorize(:light_blue)
         puts ''
         puts "Nothing against the north pole, but seriously!".colorize(:blue)
    when 'rain and snow'
         puts "Icebergs all over your shit..".bold.blink.colorize(:light_blue)
         puts ''
         puts "Time to get cozy and watch Titanic again!.".colorize(:blue)
    when 'light shower snow'
         puts "Fucking ice age.".bold.blink.colorize(:light_blue)
         puts ''
         puts "The movie was great, the weather is not.".colorize(:blue)
    when 'shower snow'
         puts "Hello? yes, this is snow-man.".bold.blink.colorize(:light_blue)
         puts ''
         puts "It's time to build me. Look outside fancy pants.".colorize(:blue)
    when 'heavy shower snow'
         puts "It's fucking skiing time.".bold.blink.colorize(:light_blue)
         puts ''
         puts "Snow every where, yay!".colorize(:blue)
    when 'overcast clouds'
         puts "Cloudy with a chance of....".bold.blink.colorize(:light_blue)
         puts ''
         puts "You thought I would say meatballs right? Stupid.".colorize(:blue)
    when 'few clouds'
         puts "Meh...Just stayin bed.".bold.blink.colorize(:light_blue)
         puts ''
         puts "You can browse Tumblr & play Angrybirds.".colorize(:blue)
    when 'scattered clouds'
         puts "It’s likea meh…kinda day".bold.blink.colorize(:light_blue)
         puts ''
         puts "But you can change it with a smile :) Or drugs.".colorize(:blue)
    when 'broken clouds'
         puts "Fucking fifty shades of grey".bold.blink.colorize(:light_blue)
         puts ''
         puts "Fucking grey clouds everywhere".colorize(:blue)
    when 'clear sky'
         puts "It's fucking tropical.".bold.blink.colorize(:light_blue)
         puts ''
         puts "Ice Cream is my final answer.".colorize(:blue)
    when 'mist'
         puts "It's justfucking grey.".bold.blink.colorize(:light_blue)
          puts ''
          puts "Just mist & no love, but computer games".colorize(:blue)
    when 'smoke'
          puts "It's getting fucking dark.".bold.blink.colorize(:light_blue)
          puts ''
          puts "The storm is coming - May the Force be with you.".colorize(:blue)
    when 'haze'
         puts "It's fucking cloudy.".bold.blink.colorize(:light_blue)
         puts ''
         puts "The storm is coming - May the Force be with you.".colorize(:blue)
    when 'sand/ dust whirls'
         puts "It's getting fucking dark.".bold.blink.colorize(:light_blue)
         puts ''
         puts "The storm is coming - May the Force be with you.".colorize(:blue)
    when 'fog'
         puts "It's fucking foggy.".bold.blink.colorize(:light_blue)
         puts ''
         puts "It's getting cold outside!".colorize(:blue)
    when 'sand'
         puts "It's getting fucking dark.".bold.blink.colorize(:light_blue)
         puts ''
         puts "The storm is coming - May the Force be with you.".colorize(:blue)
    when 'dust'
         puts "It's getting fucking dark.".bold.blink.colorize(:light_blue)
         puts ''
         puts "The storm is coming - May the Force be with you.".colorize(:blue)
    when 'volcanic ash'
         puts "It's getting fucking dark.".bold.blink.colorize(:light_blue)
         puts ''
         puts "The storm is coming - May the Force be with you".colorize(:blue)
    when 'squalls'
         puts "It's getting fucking dark.".bold.blink.colorize(:light_blue)
         puts ''
         puts "The storm is coming - May the Force be with you.".colorize(:blue)
    when 'tornado'
         puts "It's getting fucking dark.".bold.blink.colorize(:light_blue)
         puts ''
         puts "The storm is coming - May the Force be with you.".colorize(:blue)
    when 'cold'
         puts "Am I allowed to say nipples?".bold.blink.colorize(:light_blue)
         puts ''
         puts "Because it's freezing! You get the point.".colorize(:blue)
    when 'hot'
         puts "So hot makin' me stoopid.".bold.blink.colorize(:light_blue)
         puts ''
         puts "I heard that Ryan Gosling said this.".colorize(:blue)
    when 'windy'
         puts "It's fucking windy.".bold.blink.colorize(:light_blue)
         puts ''
         puts "It's getting cold outside!".colorize(:blue)
    when 'hail'
         puts "It's a wee bit nippy!".bold.blink.colorize(:light_blue)
         puts ''
         puts "This is for you my Scottish friends.".colorize(:blue)
    else
        "\u{3F}" 
    end
  end
end 
  
class Helper
    def self.compass(deg)
        value = ((deg.to_f / 22.5) + 0.5).floor
        direction = ["N", "NNE", "NE", "ENE", "E", "ESE", "SE", "SSE", "S", "SSW", "SW", "WSW", "W", "WNW", "NW", "NNW"]
        return direction[(value % 16)]
    end 

    def self.open_link_search
        link = "https://www.google.com/maps/place/#{@weather_today.coord.gsub(" ", "")}"
        if RbConfig::CONFIG['host_os'] =~ /mswin|mingw|cygwin/
          system "start #{link}"
        elsif RbConfig::CONFIG['host_os'] =~ /darwin/
          system "open #{link}"
        elsif RbConfig::CONFIG['host_os'] =~ /linux|bsd/
          system "xdg-open #{link}"
        end
    end

    def self.open_link
        link =  @link 
        if RbConfig::CONFIG['host_os'] =~ /mswin|mingw|cygwin/
          system "start #{link}"
        elsif RbConfig::CONFIG['host_os'] =~ /darwin/
          system "open #{link}"
        elsif RbConfig::CONFIG['host_os'] =~ /linux|bsd/
          system "xdg-open #{link}"
        end
      end
    
      def self.open_link_2
        link =  @link_2
        if RbConfig::CONFIG['host_os'] =~ /mswin|mingw|cygwin/
          system "start #{link}"
        elsif RbConfig::CONFIG['host_os'] =~ /darwin/
          system "open #{link}"
        elsif RbConfig::CONFIG['host_os'] =~ /linux|bsd/
          system "xdg-open #{link}"
        end
      end
    
      def self.open_link_3
        link =  @link_3
        if RbConfig::CONFIG['host_os'] =~ /mswin|mingw|cygwin/
          system "start #{link}"
        elsif RbConfig::CONFIG['host_os'] =~ /darwin/
          system "open #{link}"
        elsif RbConfig::CONFIG['host_os'] =~ /linux|bsd/
          system "xdg-open #{link}"
        end
      end
    
      def self.open_link_4
        link =  @link_4
        if RbConfig::CONFIG['host_os'] =~ /mswin|mingw|cygwin/
          system "start #{link}"
        elsif RbConfig::CONFIG['host_os'] =~ /darwin/
          system "open #{link}"
        elsif RbConfig::CONFIG['host_os'] =~ /linux|bsd/
          system "xdg-open #{link}"
        end
      end      
end 


class Error < StandardError

    def message
        box = TTY::Box.error("Sorry location not found")
        print box
    end
end

