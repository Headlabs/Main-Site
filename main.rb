

# Route Sections
# ==============


get '/' do
  slim :index
end

get '/get_video' do
  content_type :json
  
  { video_ids: Youtube.new(params[:search_term]).query }.to_json
end