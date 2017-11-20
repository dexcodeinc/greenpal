set :stage, :production
set :rails_env, 'production'

set :server_name, 'dexcode.com'
set :rvm_ruby_version, '2.2.3'

# http://stackoverflow.com/questions/21036175/how-to-deploy-a-specific-revision-with-capistrano-3
set :branch, ENV['REVISION'] || ENV['BRANCH_NAME'] || 'master'

server 'dexcode.com', user: 'deploy', roles: %w{web app}
