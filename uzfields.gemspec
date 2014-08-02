$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "uzfields/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "uzfields"
  s.version     = Uzfields::VERSION
  s.authors     = ["Leo Uzon"]
  s.email       = ["leo.uz86@gmail.com"]
  s.homepage    = "theleouzon.com"
  s.summary     = "Just like simple_fields but built with partials, easy to customize and with awesome generators."
  s.description = s.summary

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["spec/**/*"]

  s.add_dependency "rails", "~> 3.2.17"
  # s.add_dependency "jquery-rails"
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'debugger'
  # s.add_development_dependency 'capybara'
  # s.add_development_dependency 'factory_girl_rails'

  s.add_development_dependency "sqlite3"
end
