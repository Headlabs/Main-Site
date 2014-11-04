#!/usr/bin/ruby

require 'rubygems'
require 'google/api_client'
require 'trollop'

class Youtube
    # Set DEVELOPER_KEY to the "API key" value from the "Access" tab of the
    # Google Developers Console <https://cloud.google.com/console>
    # Please ensure that you have enabled the YouTube Data API for your project.
    @@DEVELOPER_KEY = ""
    @@YOUTUBE_API_SERVICE_NAME = "youtube"
    @@YOUTUBE_API_VERSION = "v3"

  def initialize(search_term)

    puts "##"
    puts search_term.inspect
    @opts = Trollop::options do
      opt :q, search_term, :type => String, :default => search_term
      opt :maxResults, 'Max results', :type => :int, :default => 10
    end

    @client = Google::APIClient.new(:key => @@DEVELOPER_KEY,
                                 :authorization => nil, 
                                 application_name: 'Jukey', 
                                 application_version: '1.0')
                                 
    @youtube = @client.discovered_api(@@YOUTUBE_API_SERVICE_NAME, @@YOUTUBE_API_VERSION)
  end

  def query
    # Call the search.list method to retrieve results matching the specified
    # query term.
    @opts[:part] = 'id'
    
    search_response = @client.execute!(
      :api_method => @youtube.search.list,
      :parameters => @opts
    )

    videos = []

    # Add each result to the appropriate list, and then display the lists of
    # matching videos, channels, and playlists.
    search_response.data.items.each do |search_result|
      case search_result.id.kind
        when 'youtube#video'
          videos.push("#{search_result.id.videoId}")
      end
    end
    
    videos
  end
end