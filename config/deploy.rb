# config valid for current version and patch releases of Capistrano
lock "~> 3.10.0"

set :application, 'greenpal'
set :repo_url, 'git@github.com:dexcodeinc/greenpal'

set :user, 'deploy'
set :use_sudo, false

set :deploy_via, :remote_cache
set :deploy_to, '/var/deploy/greenpal'

set :linked_files, %w{env Procfile config/puma.rb config/secrets.yml}
set :linked_dirs, %w{log tmp/cache tmp/sockets tmp/pids public/uploads public/system}

set :bundle_without, %w{development test}.join(' ')

set :ssh_options, {
  forward_agent: true,
  port: 22,
  auth_methods: %w(publickey)
}

after 'deploy:finished', 'foreman:restart'
