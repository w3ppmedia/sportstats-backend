web: bundle exec puma -C config/puma.rb
resque_scheduler: PRE_TERM_TIMEOUT=7 TERM_CHILD=1 RESQUE_TERM_TIMEOUT=2 bundle exec rake resque:scheduler
#resque_all: PRE_TERM_TIMEOUT=7 TERM_CHILD=1 RESQUE_TERM_TIMEOUT=2 bundle exec rake resque:work QUEUE=*
