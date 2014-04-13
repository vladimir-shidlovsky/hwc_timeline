class GamesController < ApplicationController
  def index
    @game_days = Game.order(:date).group_by{ |game| game.date.to_date }.to_a
  end

  def show
    @game = Game.find(params[:id])
  end
end
