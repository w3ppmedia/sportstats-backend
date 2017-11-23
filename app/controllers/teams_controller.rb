class TeamsController < ApplicationController
  def index
    Resque.enqueue(MatchUpdatesQueuer)
    render plain: 'match queuer has started'
  end
end
