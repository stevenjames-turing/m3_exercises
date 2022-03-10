require 'rspec'
require 'dotenv'
require 'json'
require 'faraday'

Dotenv.load

Dir["./lib/*.rb"].each { |file| require file }
