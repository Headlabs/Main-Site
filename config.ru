require 'bundler'

Bundler.require

require 'sass/plugin/rack'
# use scss for stylesheets
Sass::Plugin.options[:style] = :compressed
use Sass::Plugin::Rack

require 'active_record'


# Load configuration
Dir["./app/config/**.rb"].each { |file| require file }

# Load Models
Dir["./app/models/**.rb"].each { |file| require file }

# Load Helpers
Dir["./app/helpers/**.rb"].each { |file| require file }

# Load controllers
Dir["./app/controllers/**.rb"].each { |file| require file }

require './main'

run Sinatra::Application
