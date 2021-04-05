![weather_today](https://user-images.githubusercontent.com/72950188/113460639-0ffa8b00-93df-11eb-857e-f53f2bf7127e.png)
<div align="center">
  <p>With this CLI, you can easily check the weather from an API and few more things.</p>
</div>

# Hello 

Welcome to WeatherToday! 

This CLI was build to give you a quick update of the weather on your location and also in any city you ask for. It will too provide headlines of BBC news as a plus. 

So what can I do with this gem: 

- Check the current weather at your location and Forecast for the next 5 days 
- Check the current weather and Forecast for the next 5 days at any city you name in the world plus a link to the city location on Google Maps. It only works with city names. 

-  It gives you 3 unit system to choose from: 
  - Default (temperatures in Kelvin)
  - Metric (temperatures in Celsius)
  - Imperial (temperatures in Fahrenheit)

- Read and open in your browser the latest world headlines from BBC News. 
- Gives you a funny quote according to weather conditions cortesy of the [AUTHENTIC WEATHER APP](https://github.com/reduxd/authentic-ubersicht). 
- Also a Big Good Bye. 

## Important information 

Before running the CLI is important to: 

- Sign up for a API key on [OPENWEATHERMAP](https://openweathermap.org/). It's free
- Sign up for a API key on [NEWSAPI](https://newsapi.org/). Also Free. 
- Sign up for a API key on [Abstract](https://app.abstractapi.com/). To get a precise timeZone on the location enquiry. They've got a free plan too. So all cool. 

Please don't forget to create a `.env` for the root of the project. This will hide your API Keys and avoid to be published on your repository in case you fork it. 

Inside the `.env` file add the following 3 lines of code:

```cassandraql
API_KEY = YOURKEY
API_ABSTRACT = YOURKEY
API_NEWS = YOURKEY
```
Just reach the right directory and type `bin/weather_today` in your terminal. 

"Voila" you are ready to check the weather and news. 

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'weather_today'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install weather_today

## Usage

Run `bin/weather_today` 

Follow the prompts on your terminal. 

The current Weather information will be display automatically after choosing your weather settings. This data is based on your current and IP address.

Forecast is display as shown: 
- Weather condition
- Temperature
- Humidity
- Chance of precipitation
- UV Index
 ![2](https://user-images.githubusercontent.com/72950188/113636671-94941600-9638-11eb-862d-1606166bf12b.png)

World's News will display the main 4 headlines from BBC News NewsAPI source. Follow the prompts to read and open a new Browser window. 
![Screenshot 2021-04-05 at 18 02 10](https://user-images.githubusercontent.com/72950188/113636955-23a12e00-9639-11eb-8ea4-07ffabb1b6ef.png)

Finally to get the current weather at a certain city anywhere in the world type the city name. However for more accurate results type `<city name>, <Alpha-2 ISO 3166 country codes>`. Example: 

```ruby
'Paris,FR' 
```
Check info of the Alpha-2 country codes [HERE](https://en.wikipedia.org/wiki/List_of_ISO_3166_country_codes)

The current Weather information will be display automatically after choosing your weather settings. Also will show date and time of the location requested.
Forecast is display as shown: 
- Weather condition
- Temperature
- Humidity
- Chance of precipitation

Follow the prompt menu to reach the location coordenates on Google Maps. A new Browser window will pop up. 


## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/<github username>/weather_today. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/<github username>/weather_today/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the WeatherToday project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/<github username>/weather_today/blob/master/CODE_OF_CONDUCT.md).
