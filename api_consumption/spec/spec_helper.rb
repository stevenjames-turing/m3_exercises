require 'rspec'
require 'dotenv'
require 'json'

Dotenv.load

Dir["./lib/*.rb"].each { |file| require file }
