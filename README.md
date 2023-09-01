# Oblyk RoRVsWild Agent

Oblyk uses the very good rorvswild tool to monitor its API server. 
This project is a minimal installation of Ruby On Rails with the rorvswild Gem to collect metrics from the front and database servers and aggregate them in the monitoring back office.

Ruby version : 3.1.2
Rails version : 7.0.7

## Start or kill app

For start app :
```shell
cd /your/app/folfer/
RAILS_ENV=production bundle exec rails server --daemon
```

to kill app :
```shell
kill `cat /your/app/folfer/tmp/pids/server.pid`
```