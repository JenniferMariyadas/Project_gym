require('minitest/autorun')
require_relative('./session')

class SessionTest < MiniTest::Test

  def set up
    options = {"session_name"=> "HIIT", "type"=>"Cardio",
      "start_time"=>"2017-01-08 04:00:00"}
      @session = Session.new(options)
    end

    def test_session_name
      result = @session.session_name()
      assert_equal("HIIT", result)
    end

    def test_type
      result = @session.type()
      assert_equal("Cardio", result)
    end

    def test_start_time
      result = @session.start_time()
      assert_equal("2017-01-08 04:00:00", result)
    end

    def test_format_name
      result = @session.format_name()
      assert_equal("HIIT", result)
    end

  end
