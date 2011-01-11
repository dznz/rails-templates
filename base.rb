
if yes?("Do you want to use Mongoid?")
  gem "mongoid"
  gem "bson_ext"
  generate "mongoid:config"
end

if yes?("Do you want to use Rspec?")
  gem 'rspec-rails', :group => [:development, :test]
  generate "rspec:install"
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

git :add => ".", :commit => "-m 'initial commit'"
