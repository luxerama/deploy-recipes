require 'capistrano'
require 'capistrano/cli'
require 'common'

Dir.glob(File.join(File.dirname(__FILE__), '/deploy-recipes/*.rb')).sort.each { |f| load f }