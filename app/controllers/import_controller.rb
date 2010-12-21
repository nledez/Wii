class ImportController < ApplicationController
  def import
  end
  
  def upload
    @games = []
    data = []
    data = params[:import][:csv]
    data.each { |line|
      (gameid, id) = line.split(/:/)
      gameid.strip!
      @games.push gameid
      @game = Game.new(:gameid => gameid, :user_id => 1)
      @game.save
    }
  end
end
