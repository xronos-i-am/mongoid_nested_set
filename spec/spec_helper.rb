$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'rspec'
require 'database_cleaner'
require 'active_support'
require 'active_support/deprecation'
require 'mongoid'
require 'mongoid-rspec'
require 'mongoid_nested_set'

if ENV['COVERAGE'] == 'yes'
  require 'simplecov'
  require 'simplecov-rcov'

  class SimpleCov::Formatter::MergedFormatter
    def format(result)
      SimpleCov::Formatter::HTMLFormatter.new.format(result)
      SimpleCov::Formatter::RcovFormatter.new.format(result)
    end
  end

  SimpleCov.formatter = SimpleCov::Formatter::MergedFormatter
  SimpleCov.start 
end

Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}
Dir["#{File.dirname(__FILE__)}/models/*.rb"].each {|file| require file }
Dir["#{File.dirname(__FILE__)}/matchers/*.rb"].each {|file| require file }

#Mongo::Logger.logger.level = ::Logger::FATAL

Mongoid.load!("#{File.dirname(__FILE__)}/mongoid.yml", :test)

RSpec.configure do |config|
  config.include Mongoid::Matchers, type: :model

  config.before(:suite) do
    DatabaseCleaner[:mongoid, {client: :default }]
    DatabaseCleaner[:mongoid].strategy = :truncation
  end

  config.before(:each) do
    DatabaseCleaner.clean
  end

  config.include(Mongoid::Acts::NestedSet::Matchers)

  config.after(:each) do
    Mongoid::Config.purge!
  end
end
