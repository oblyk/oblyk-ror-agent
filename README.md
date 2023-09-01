# Oblyk RoRVsWild Agent

Oblyk uses the very good [rorvswild](https://www.rorvswild.com/) tool to monitor its API server. 
This project is a minimal installation of Ruby On Rails with the RoRVsWild Gem to collect metrics from the front and database servers and aggregate them in the monitoring back office.

- Ruby version : 3.1.2
- Rails version : 7.0.7

## From scratch installation on Debian server

**Note:** "Deployment" is managed by pulling the 'oblyk-ror-agent' repository via git.  
**Note 2:** The following approach works for Oblyk's servers, I'm documenting my approach so that you can get inspired. Adapt the following to your needs and environment.

### On your local computer

Create a lightness Ruby on Rails app on your personal computer.

```shell
rails new oblyk-ror-agent --api
cd oblyk-ror-rails
```

**Install ror-vs-wild gem**
Follow RoRVsWild instruction : https://github.com/BaseSecrete/rorvswild

### On your production serveur

Installing the minimum for rails to work :
- sqlite3 (`apt install sqlite3`)
- ruby (preferably with rbenv? https://github.com/rbenv/rbenv) version 3.2.1 for this project

Clone oblyk-ror-agent on your server :
```shell
cd /path/to/your/applications
git clone https://github.com/oblyk/oblyk-ror-agent.git
```

install gem
```shell
bundle
```

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