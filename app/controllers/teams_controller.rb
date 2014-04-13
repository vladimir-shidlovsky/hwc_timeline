class TeamsController < ApplicationController
  def index
    @teams = Team.order("name_#{ I18n.locale }")
  end

  def show
    @team = Team.find(params[:id])
  end
end
