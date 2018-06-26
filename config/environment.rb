# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

ENV['SINATRA_ENV'] ||= "development"

require 'bundler/setup'
Bundler.require(:default, ENV['SINATRA_ENV'])

ActiveRecord::Base.establish_connection(
                                        :adapter => "sqlite3",
                                        :database => "db/#{ENV['SINATRA_ENV']}.sqlite"
                                        )

require_all 'app'
