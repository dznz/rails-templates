
if yes?("Do you want to use Mongoid?")
  gem "mongoid", "2.0.0.rc.1"
  gem "bson_ext"
  generate "mongoid:config"
puts <<MANUAL_STEPS

== Remember To ==
replace "require \'rails/all\'" with the following
require "action_controller/railtie"
require "action_mailer/railtie"
require "active_resource/railtie"

MANUAL_STEPS
end

if yes?("Do you want to use Cucumber and Rspec?")
  gem 'cucumber-rails', :group => [:development, :test]
  gem 'capybara', :group => [:development, :test]
  #gem 'database_cleaner', "0.6.0", :group => [:development, :test]
  gem 'rspec-rails', :group => [:development, :test]
  generate "cucumber:install", "--rspec --capybara --skip-database"
  generate "rspec:install"
puts <<MANUAL_STEPS

== Remember To ==
Remove config.fixture_path and config.use_transactional_fixtures lines from spec_helper.rb if using Mongoid

MANUAL_STEPS
end

# Git initialisation
git :init

run "echo 'TODO add readme content' > README"
run "touch tmp/.gitignore log/.gitignore vendor/.gitignore"
run "cp config/database.yml config/example_database.yml"

file ".gitignore", <<-END
log/*.log
tmp/**/*
config/database.yml
db/*.sqlite3
END

git :add => "."
git :commit => "-m 'initial commit'"
