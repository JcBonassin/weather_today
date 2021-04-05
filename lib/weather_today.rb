require 'pry'
require 'bundler'
require 'dotenv'
Dotenv.load('./.env')
require 'JSON'
require 'httparty'
require 'paint'
require 'open-uri'
require 'uri'
require 'net/http'
require 'openssl'
require 'dotenv/load'
require 'colorize'
require 'tty-prompt'
require "tty-table"
require "tty-spinner"
require "tty-box"


require_relative "weather_today/version"
require_relative './weather_today/cli'
require_relative './weather_today/helper'
require_relative './weather_today/weather'
require_relative './weather_today/weather_search'
require_relative './weather_today/animation'
