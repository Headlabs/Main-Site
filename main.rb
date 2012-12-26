#Route Sections
get '/' do
  slim :index
end

get '/skills' do
  slim :skills
end

get '/read' do
  slim :read
end
  
get '/misc' do
  slim :misc  
end

