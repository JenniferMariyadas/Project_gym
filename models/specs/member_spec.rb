require('minitest/autorun')
require_relative("./member")

class TestMember < MiniTest::Test

  def setup
    options = {"first_name" => "Stine", "last_name" => "Slotsbo",
      "gender" => "female", "age"=. 40 }
      @member = Member.new (options)
    end

    def test_first_name()
      result = @member.first_name()
      assert_equal("Stine", result)
    end

    def test_last_name()
      result = @member.last_name()
      assert_equal("Slotsbo", result)
    end

    def test_gender()
      result = @member.gender()
      assert_equal("female", result)
    end

    def test_age()
      result = @member.age()
      assert_equal(5, result)
    end

    def test_format_name()
      result = @member.format_name()
      assert_equal("Stine Slotsbo", result)
    end

  end
