require 'rubygems'

# Set up gems listed in the Gemfile.
ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../Gemfile', __FILE__)

require 'bundler/setup' if File.exists?(ENV['BUNDLE_GEMFILE'])

# Set the default port to 20000 in prod, 20001 in all else
require 'rails/commands/server'
module Rails
  class Server
    def set_environment
      ENV["RAILS_ENV"] ||= options[:environment]
      if ENV["RAILS_ENV"] == "production"
        options[:Port] = 20000
      else 
        options[:Port] = 20001
      end
    end
  end
end
