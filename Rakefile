require 'rake'
require "sinatra/activerecord/rake"
require ::File.expand_path('../config/environment', __FILE__)

Rake::Task["db:create"].clear
Rake::Task["db:drop"].clear

# NOTE: Assumes a Postgres DB
desc "create the database"
task "db:create" do
  touch 'db/development_db.sqlite3'
	touch 'db/test_db.sqlite3'
end

desc "drop the database"
task "db:drop" do
  rm_f 'db/development_db.sqlite3'
	rm_f 'db/test_db.sqlite3'
end

desc 'Retrieves the current schema version number'
task "db:version" do
  puts "Current version: #{ActiveRecord::Migrator.current_version}"
end
