ENV["RACK_ENV"] ||= "test"

require File.expand_path('../../config/environment', __FILE__)
require 'minitest/autorun'
require 'minitest/pride'
require 'tilt/erb'
require 'capybara'
require 'capybara/dsl'


module TestHelpers
  def setup
    DatabaseCleaner.start
    super
  end

  def teardown
    DatabaseCleaner.clean
    super
  end

  def golem_yard
    database = Sequel.sqlite("db/golem_yard_test.sqlite3")
    @golem_yard ||= GolemYard.new(database)
  end
end

DatabaseCleaner[:sequel, {:connection => Sequel.sqlite("db/golem_yard_test.sqlite3")}].strategy = :truncation

Capybara.app = GolemYardApp
Capybara.save_and_open_page_path = 'tmp/capybara'

class FeatureTest < Minitest::Test
  include Capybara::DSL
  include TestHelpers
end
