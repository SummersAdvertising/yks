require 'capistrano/ext/multistage'
require 'bundler/capistrano' 				#Using bundler with Capistrano

set :stages, %w(staging production)
set :default_stage, "production"

default_run_options[:pty] = true

after 'deploy:sym_link', 'localize:munge_environment'
namespace :localize do
  desc 'munge environment.rb to set staging environment'
  task :munge_environment, :roles => [:app] do
    new_env = "ENV['RAILS_ENV'] = 'development'\n" + File.read(Rails.root.join('config', 'environment.rb'))
    put new_env, "#{current_path}/config/environment.rb"
  end
end

desc "precompile the assets"
task :precompile_assets, :roles => :web, :except => { :no_release => true } do
	run "cd #{current_path}; rm -rf public/assets/*"
	run "cd #{current_path}; RAILS_ENV=production bundle exec rake assets:precompile"
end

# ==============================
# Uploads
# ==============================

uploads_dirs = ['banners', 'news', 'user_exps']

namespace :uploads do

  desc <<-EOD
    Creates the upload folders unless they exist
    and sets the proper upload permissions.
  EOD
  task :setup, :except => { :no_release => true } do
    dirs = uploads_dirs.map { |d| File.join(shared_path, d) }
    run "#{try_sudo} mkdir -p #{dirs.join(' ')} && #{try_sudo} chmod g+w #{dirs.join(' ')}"
  end

  desc <<-EOD
    [internal] Creates the symlink to uploads shared folder
    for the most recently deployed version.
  EOD
  task :symlink, :except => { :no_release => true } do
    run "rm -rf #{release_path}/public/uploads"
    run "ln -nfs #{shared_path}/#{stage}/uploads #{release_path}/public/uploads"
  end

  desc <<-EOD
    [internal] Computes uploads directory paths
    and registers them in Capistrano environment.

    Note. I can't set value for directories directly in the code because
    I don't know in advance selected stage.
  EOD
  task :register_dirs do
    set :uploads_dirs,    %w(uploads uploads/partners).map { |d| "#{stage}/#{d}" }
    set :shared_children, fetch(:shared_children) + fetch(:uploads_dirs)
  end

  after       "deploy:finalize_update", "uploads:symlink"
  on :start,  "uploads:register_dirs",  :except => stages + ['multistage:prepare']

end