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
- ruby (preferably with rbenv? https://github.com/rbenv/rbenv) version 3.2.1 for this project _(problem ? see troubleshooting 1)_
- bundler 

**Tips :** for install rbenv and bundler follow this guide : https://www.digitalocean.com/community/tutorials/how-to-install-ruby-on-rails-with-rbenv-on-debian-8 until `gem install bundler`

Clone oblyk-ror-agent on your server :
```shell
cd /path/to/your/applications
git clone https://github.com/oblyk/oblyk-ror-agent.git
```

Install gem
```shell
bundle
```
_(problem ? see troubleshooting 2)_

Copy local_env.example.yml
```shell
cp config/local_env.example.yml config/local_env.yml
nano config/local_env.yml
# enter your RorVsWild key
```

Create your `config/master.key` file

test if it works :
```shell
RAILS_ENV=production bundle exec rails s
```
Go to your RorVsWild back office, tab : server  
Your data influx?

## Start or kill app

Run your application in background with nohup :
```shell
cd /your/app/folfer/
RAILS_ENV=production nohup bundle exec rails s &
```

**Note** : for some reason running server rails in --daemon mode does not work

Check that your app is running
```shell
ps -aux | grep puma
```

to kill app :
```shell
kill `cat /your/app/folfer/tmp/pids/server.pid`
```

## Troubleshooting

### 1. Problem installing ruby version

If installing a ruby version takes a long time and blocks on 'install openssl ...'  
Try installing `libssl-dev`
```shell
sudo apt-get install libssl-dev
```

### 2. Problem installing pschy when install gem

If you get this error when installing gems :  
> An error occurred while installing psych (5.1.0), and Bundler cannot continue.

Try installing `libyaml-dev`
```shell
sudo apt-get install libyaml-dev
```
