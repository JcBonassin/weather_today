require 'pry'
require 'bundler'
require 'JSON'
require 'httparty'
require 'paint'
require 'open-uri'
require 'uri'
require 'net/http'
require 'openssl'
require 'dotenv/load'
require 'open_weather'
require 'geocoder'
require 'colorize'
require 'news-api'
require 'tty-prompt'
require "tty-table"


require_relative "weather_today/version"
require_relative './weather_today/cli'
require_relative './weather_today/weather'
require_relative './weather_today/weather_search'
require_relative './weather_today/graphics'
require_relative './weather_today/quotes'
