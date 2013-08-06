require 'bundler/capistrano'

set :application, 'flightconf'
set :deploy_to,   '/var/www/flightconf'

set :rails_env, :production
set :branch,    :master
servers =       ['flightconf.com']
role :app,      *servers
role :web,      *servers

set :user,        'www-data'
set :use_sudo,    false

set :repository,  'git@github.com:jerhinesmith/flightconf.git'
set :scm,         :git
set :deploy_via,  :remote_cache

# Cleanup
set :keep_releases, 5
after "deploy:update", "deploy:cleanup"

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end