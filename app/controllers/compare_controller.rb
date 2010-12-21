class CompareController < ApplicationController
  require 'import-csv'
  include CsvToArray
  #load "#{Rails.root}/lib/wii_images_url.rb"
  require 'wii_images_url'
  include WiiImages

  def compare
  end

  def upload
    #render :text => params.to_json
    @games_db = Game.all.map { |g| g.gameid }
    @games_guest = []
    @games_summary_temp = []
    @games_summary = {}
    @games_guest = import_csv_to_array(params[:import][:csv])

    @games_summary_temp = @games_db | @games_guest
    
    @games_summary_temp.each { |game|
      if @games_db.include?(game) && @games_guest.include?(game)
        @games_summary[game] = "blank" # Tout le monde l'a
      elsif @games_db.include?(game) && (not @games_guest.include?(game))
        @games_summary[game] = "green" # Tu n'as pas
      elsif (not @games_db.include?(game)) && @games_guest.include?(game)
        @games_summary[game] = "red" # Je n'ai pas
      end
    }
  end
end
