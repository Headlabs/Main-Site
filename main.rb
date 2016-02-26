

# Route Sections
# ==============


get '/' do
  slim :index
end

get '/projects' do
  slim :projects
end
