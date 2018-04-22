class TeamsController < ApplicationController
  def index
    Resque.enqueue(CrowdscoresUpdateRounds)
    render plain: 'match queuer has started'
  end
end
