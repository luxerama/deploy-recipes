require 'capistrano'
require 'capistrano/cli'
require "#{File.dirname(__FILE__)}/helpers"

Dir.glob(File.join(File.dirname(__FILE__), '/deploy-recipes/*.rb')).sort.each { |f| load f }