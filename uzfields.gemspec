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
  
  s.add_dependency "slim"
  s.add_dependency "slim-rails"
  # s.add_dependency "jquery-rails"
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'debugger'
  
  # s.add_development_dependency 'capybara'
  # s.add_development_dependency 'factory_girl_rails'

  s.add_development_dependency "sqlite3"
end


# source 'http://rubygems.org'
# # assets processors ========================================
# gem 'uglifier', '>= 1.0.3' 
# gem 'therubyracer', :platform => :ruby
# gem 'sass', '3.2.10'
# gem 'sass-rails'
# gem 'compass'
# gem 'compass-rails'

# gem 'coffee-rails', '~> 3.2.1'


# # assets libraries =========================================
# gem 'jquery-rails'
# gem 'jquery-ui-rails'
# gem 'underscore-rails'

# gem 'jquery-fileupload-rails'
# gem 'fancybox2-rails', '~> 0.2.4'
# gem 'bootstrap-sass', '~> 3.1.1'
# gem 'font-awesome-sass'
# gem 'bootstrap-wysihtml5-rails'

# # image processing =========================================
# # gem 'fog'
# gem 'rmagick', :require => 'RMagick'
# gem 'carrierwave'

# # main =====================================================
# gem 'sitemap_generator'
# gem 'figaro'

# # model helpers ============================================
# gem "strip_attributes"
# gem 'acts-as-taggable-on'
# # gem 'will_paginate', '~> 3.0'
# gem "kaminari"
# gem 'simple_form'
# gem 'twitter'
# gem 'twitter-text'

# # home made ================================================
# # gem "uzcommon", :path => "~/dev-projects/uzcommon"
# gem "uzcommon", git: 'git://github.com/leouz/uzcommon.git', :branch => 'ohm-dev'
# # gem "uzcommon", git: 'git://github.com/leouz/uzcommon.git', :branch => 'ohm'

# gem 'faker'
# gem 'populator'
# # gem "delocalize"
# # gem "i18n_alchemy"

# # deploy ================
# gem 'capistrano', '~> 3.2.0'
# gem 'capistrano-rails', '~> 1.1'
