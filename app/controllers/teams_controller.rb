class TeamsController < ApplicationController
  def index
    Resque.enqueue(CrowdscoresUpdateTeams)
    render plain: 'match queuer has started'
  end
end
