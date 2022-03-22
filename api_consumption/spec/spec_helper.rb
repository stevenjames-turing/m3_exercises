require 'rspec'
require 'json'
require 'faraday'

require 'dotenv'
Dotenv.load

Dir["./lib/*.rb"].each { |file| require file }
