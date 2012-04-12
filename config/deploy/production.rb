set :application, 	"yks"
set :domain, 		"li406-49.members.linode.com"
set :repository, 	"git@github.com:SummersAdvertising/yks.git"
set :deploy_to,		"/var/spool/RoR-Projects/yks"

role :app,		domain
role :web,	domain
role :db, 		domain,	:primary => true

set :deploy_via, :remote_cache
set :deploy_env, "production"
set :rails_env, "production"
set :scm, :git
set :branch, "master"
set :scm_verbose, true
set :use_sudo, false
set :user, "apps"
set :password, "1qaz2wsx"
set :group, "webs"

default_environment["PATH"] = "/opt/ree/bin:/usr/local/bin:/usr/bin:/bin:/usr/games"
#default_environment['PATH']='/usr/lib/ruby1.8/bin:/home/apps/.gems/bin:/usr/local/bin:/usr/bin:/bin'

# $:.unshift(File.expand_path('./lib', ENV['rvm_path'])) # Add RVM's lib directory to the load path.
# require "rvm/capistrano"                  # Load RVM's capistrano plugin.
# set :rvm_ruby_string, '1.9.3-p0@rails3'        # Or whatever env you want it to run in.
# set :rvm_type, :user  # Copy the exact line. I really mean :user here

namespace :deploy do
	desc "restart"
	task :restart do
		run "touch #{current_path}/tmp/restart.txt"
	end
end

desc "Create database.yml and asset packages for production"
after("deploy:update_code") do
	db_config = "#{shared_path}/config/datebase.yml.production"
	run "cp #{db_config} #{release_path}/config/database.yml"
end

