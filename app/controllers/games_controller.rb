class GamesController < ApplicationController
  #load "#{Rails.root}/lib/wii_images_url.rb"
  require 'wii_images_url'
  include WiiImages
  
  # GET /games
  # GET /games.xml
  def index
    @games = Game.all
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @games }
      format.text  { render :text => @games.map { |g| "#{g.gameid}\n" } }
    end
  end
  
  def selections
  end
  
  def check
    @games = Game.where(:img_url => nil)
    
    @games.each { |game|
      puts "Check #{game.gameid}"
      game.img_url = check_game_image(game.gameid)
      game.save
    }
    
    respond_to do |format|
      format.html { redirect_to :games}
      format.xml  { render :xml => @games }
      format.text  { render :text => @games.map { |g| "#{g.gameid}\n" } }
    end
  end
end
