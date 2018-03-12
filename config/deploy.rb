# config valid only for current version of Capistrano
lock "3.10.1"

set :application, "arbitrage_frontend"
set :repo_url, "https://anvarzkr:anvik1992@gitlab.com:anvarzkr/arbitrage_frontend.git"
set :user, 'arbitrage'

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
# set :deploy_to, "/var/www/my_app_name"

set :deploy_to, "/home/#{fetch(:user)}/apps/#{fetch(:application)}"

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# append :linked_files, "config/database.yml", "config/secrets.yml"

# Default value for linked_dirs is []
# append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system"

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }

# Default value for keep_releases is 5
# set :keep_releases, 5

namespace :deploy do

  desc 'Restart application'
  task :restart do
    invoke 'pm2:restart'
  end

  task :npm_install do
    on "root@85.143.172.211" do
      execute "cd #{fetch(:deploy_to)}/current && npm i"
    end
  end

  task :build do
    on "root@85.143.172.211" do
      execute "cd #{fetch(:deploy_to)}/current && webpack"
    end
  end

  task :start_node_server do
    on "root@85.143.172.211" do
      # execute "cd #{fetch(:deploy_to)}/current && (nohup node server/server.js&) && sleep 1"
      execute "cd #{fetch(:deploy_to)}/current && node server/server.js"
    end
  end

  after :publishing, :restart
  after :restart, :npm_install
  after :npm_install, :build
  after :build, :start_node_server
end
