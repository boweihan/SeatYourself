ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
  test 'restaurants exist' do
    assert_equal 2, Restaurant.all.size
  end

  test 'one has large capacity' do
    assert ( restaurants(:one) > 45 )
  end
end
