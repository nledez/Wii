#!/usr/bin/env ruby

require 'URI'
require 'net/http'

module WiiImages
  def check_image(uri)
    url = URI.parse(uri)
    h = Net::HTTP.new(url.host, url.port)
    resp, data = h.get(url.path)
    resp.code
  end
  
  def check_game_image(gameid)
    result = check_game_image_type(gameid, '2D')
    result
  end
  
  def check_game_image_type(gameid, type)
    if type == '2D'
      local_path = '2D/'
      url_path = 'cover'
    end
    
    uri = "http://wiitdb.com/wiitdb/artwork/#{url_path}/FR/#{gameid}.png"
    result = check_image(uri)
    puts "#{result} #{uri}"
    if (result == '302' || result == '404')
      uri = "http://wiitdb.com/wiitdb/artwork/#{url_path}/US/#{gameid}.png"
      result = check_image(uri)
    end
    puts "#{result} #{uri}"
    if (result == '302' || result == '404')
      uri = "http://wiitdb.com/wiitdb/artwork/#{url_path}/EN/#{gameid}.png"
      result = check_image(uri)
    end
    puts "#{result} #{uri}"
    if (result == '302' || result == '404')
      uri = "http://wiitdb.com/wiitdb/artwork/#{url_path}/JA/#{gameid}.png"
      result = check_image(uri)
    end
    puts "#{result} #{uri}"
    
    #result
    uri
  end  
end
