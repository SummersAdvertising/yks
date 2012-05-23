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

namespace :deploy do
	desc "restart"
	task :restart do
		run "touch #{current_path}/tmp/restart.txt"
	end
end

desc "Create database.yml and asset packages for production"
after("deploy:update_code") do
	db_config = "#{shared_path}/config/database.yml.production"
	#db_config = "#{db_config} #{release_path}/config/database.yml.production"
	run "cp #{db_config} #{release_path}/config/database.yml"
	run "ln -s -f  #{shared_path}/production/uploads/banners #{current_path}/public/"
	run "ln -s -f #{shared_path}/production/uploads/news #{current_path}/public/"
	run "ln -s -f #{shared_path}/production/uploads/user_exps #{current_path}/public/"
	run "ln -s -f #{shared_path}/production/uploads #{current_path}/public/"
	
	#run "cd #{current_path}; RAILS_ENV=production bundle exec rake cache:clear"
end
