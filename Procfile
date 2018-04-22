web: bundle exec puma -C config/puma.rb
release: bundle exec rake db:migrate
resque_scheduler: PRE_TERM_TIMEOUT=7 TERM_CHILD=1 RESQUE_TERM_TIMEOUT=2 bundle exec rake resque:scheduler
resque_team_update: PRE_TERM_TIMEOUT=7 TERM_CHILD=1 RESQUE_TERM_TIMEOUT=2 bundle exec rake resque:work QUEUE=crowdscores_update_teams
