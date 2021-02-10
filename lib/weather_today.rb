# frozen_string_literal: true

require 'pry'
require 'bundler'
require 'JSON'
require 'httparty'
require 'paint'
require 'open-uri'
require 'uri'
require 'net/http'
require 'openssl'

require_relative "weather_today/version"
require_relative './weather_today/cli'
require_relative './weather_today/weather'


