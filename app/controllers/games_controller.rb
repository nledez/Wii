class GamesController < ApplicationController
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
end
