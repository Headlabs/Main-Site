#Required Gems
require 'sinatra'
require 'slim'

#Route Sections
get '/' do
  slim :index
end

