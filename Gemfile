source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.3'

gem 'rails', '~> 6.0.3', '>= 6.0.3.1'
gem 'puma', '~> 4.1'
gem 'mysql2', '>= 0.4.4'

# Serializer
gem 'active_model_serializers'

# Utils
gem 'annotate', '~> 3.1.1'
gem 'rails-i18n', '~> 6.0.0'
gem 'devise-i18n', '~> 1.9.2'
gem 'bootsnap', '>= 1.4.2', require: false
gem 'activerecord-import', '~>1.0.7'

# Authentication
gem 'devise', '~> 4.7.1'

gem 'pg', group: :production

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'listen', '~> 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'pry-byebug'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
