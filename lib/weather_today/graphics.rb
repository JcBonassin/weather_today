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

    def visibility_range
       
        case self  
        when "0..999"
             "Fog"
        when "1000..5000"
            "Poor"
        when "5001..9999"
            "Moderate"
        when "10000"
             "Good"
        else 
            "Clear"
        end 
    end 

    
end