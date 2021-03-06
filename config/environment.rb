require 'rubygems'
require 'bundler/setup'
require 'statistics2'

require 'active_support/all'
require 'carrierwave'
require 'carrierwave/orm/activerecord'
require 'faker'
require 'mini_magick'

# Load Sinatra Framework (with AR)
require 'sinatra'
require 'sinatra/activerecord'

require 'pry'

APP_ROOT = Pathname.new(File.expand_path('../../', __FILE__))
APP_NAME = APP_ROOT.basename.to_s

# Sinatra configuration
configure do
  set :root, APP_ROOT.to_path
  set :server, :puma

  enable :sessions
  set :session_secret, ENV['SESSION_KEY'] || 'rockstars_'

  set :views, File.join(Sinatra::Application.root, "app", "views")
end

# Set up the database and models
require APP_ROOT.join('config', 'database')

# Load the routes / actions
require APP_ROOT.join('app', 'actions')

# Load the Uploader
require APP_ROOT.join('app','uploader/uploader') 
