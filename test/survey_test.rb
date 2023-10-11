ENV["RACK_ENV"] = "test"

require "fileutils"

require "minitest/autorun"
require "rack/test"
require "minitest/reporters"
Minitest::Reporters.use!

require_relative "../cms"

class CmsTest < Minitest::Test
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def session
    last_request.env["rack.session"]
  end

  def admin_session
    { "rack.session" => { username: "admin" } }
  end

  def setup
    FileUtils.mkdir_p(data_path)
  end

  def test_not_found
    get "somethingthat/does/not/exist"
    assert_equal 404, last_response.status
  end

  def teardown
    FileUtils.rm_rf(data_path)
    FileUtils.rm_rf(credentials_path)
  end
end
