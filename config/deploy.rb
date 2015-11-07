set :application, 'cap_stuff'
set :repo_url, 'git@github.com:taddeimania/cap_stuffs.git'

# Cap Django Settings
set :django_settings_dir, 'hello/hello/settings'
set :pip_requirements, 'hello/requirements/base.txt'
set :keep_releases, 5
set :nginx, true
set :django_project_dir, 'hello'
set :deploy_to, '/var/www'
set :wsgi_file, 'hello.wsgi'
set :stage, :production
set :django_settings, 'dev'

# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }

# set :deploy_to, '/var/www/my_app'
# set :scm, :git

# set :format, :pretty
# set :log_level, :debug
# set :pty, true

# set :linked_files, %w{config/database.yml}
# set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

# set :default_env, { path: "/opt/ruby/bin:$PATH" }
# set :keep_releases, 5

namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      # Your restart mechanism here, for example:
      # execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

  after :finishing, 'deploy:cleanup'

end
