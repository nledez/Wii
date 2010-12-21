class CompareController < ApplicationController
  require 'import-csv'
  include CsvToArray
  #load "#{Rails.root}/lib/wii_images_url.rb"
  require 'wii_images_url'
  include WiiImages
  
  class SimpleGame
    attr_accessor :gameid, :img_url, :color
    def initialize(gameid, img_url, color)
      @gameid = gameid
      @img_url = img_url
      @color = color
    end
  end
  
  def compare
  end
  
  def upload
    #render :text => params.to_json
    @games_my = Game.where(:user_id => 1).map { |g| g.gameid }
    @games_guest = []
    @games_summary_temp = []
    @games_summary = []
    @games_guest = import_csv_to_array(params[:import][:csv])
    
    @games_missing = @games_guest - Game.all.map { |g| g.gameid }
    
    @games_missing.each { |gameid|
      @game = Game.new(:gameid => gameid)
      @game.img_url = check_game_image(gameid)
      @game.save
    }
    
    @games_summary_temp = @games_my | @games_guest
    
    @games_summary_temp.each { |game|
      if @games_my.include?(game) && @games_guest.include?(game)
        @games_summary.push SimpleGame.new(game, Game.where(:gameid => game).first.img_url, "blank") # Tout le monde l'a
      elsif @games_my.include?(game) && (not @games_guest.include?(game))
        @games_summary.push SimpleGame.new(game, Game.where(:gameid => game).first.img_url, "green") # Tu n'as pas
      elsif (not @games_my.include?(game)) && @games_guest.include?(game)
        @games_summary.push SimpleGame.new(game, check_game_image(game), "red") # Je n'ai pas
      end
    }
  end
end
