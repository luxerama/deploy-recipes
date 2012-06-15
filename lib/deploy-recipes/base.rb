unless Capistrano::Configuration.respond_to?(:instance)
  abort "capistrano/tbg/deploy requires Capistrano 2"
end

Capistrano::Configuration.instance.load do
  # User details
  _cset :user,          'deploy'
  _cset(:group)         { user }
  
  # @TODO utilise a deployment config file outside the project to be able to DRY the deploy config system
  _cset :config_file,   '/home/#{user}/.deployment-configs.yml'
  
  # Application details
  _cset(:application)   { abort "Please specify the short name of your application, set :application, 'foo'" }
  _cset :use_sudo,      false

  # SCM settings
  _cset(:deploy_to)       { "/home/#{user}/deployments/#{application}" }
  _cset :scm,           'git'
  _cset :branch,        'master'
  _cset :deploy_via,    'remote_cache'

  # Git settings for Capistrano
  default_run_options[:pty]     = true # needed for git password prompts
  ssh_options[:forward_agent]   = true # use the keys for the person running the cap command to check out the append
  ssh_options[:auth_methods]    = ["publickey"]
  ssh_options[:keys]            = [File.join(ENV["HOME"], ".ssh", user)]
  
  # If you are using Passenger mod_rails uncomment this:
  namespace :deploy do
    task :start do ; end
    task :stop do ; end
    task :restart, :roles => :app, :except => { :no_release => true } do
      run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
    end
  end
  
end