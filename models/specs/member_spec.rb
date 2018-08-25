require("minitest/autorun")
require_relative("../member")
require_relative("../personaltrainer")
require_relative("../gymclass")


class TestMember < MiniTest::Test

  def setup
    @personaltrainer1 = PersonalTrainer.new({'name' => 'Filip Kuszenin','description' => 'test_text'});
    @gymclass1 = GymClass.new({'pt_id' => 5,'name' => 'boxing','capacity' => 20, 'day_of_week' => 'Monday', 'hour' => '12:00'});
    @member1 = Member.new({'name' => 'Karim Benzema', 'email' => 'karimbenzema@gmail.com', 'phone' => '48730996420', 'dob' => '12-04-1986', 'premium' => false});
  end

  def test_member_has_name()
    assert_equal('Karim Benzema', @member1.name)
  end

  def test_member_has_email()
    assert_equal('karimbenzema@gmail.com', @member1.email)
  end

  def test_member_has_phone()
    assert_equal(48730996420, @member1.phone)
  end

  def test_member_has_dob()
    assert_equal('12-04-1986', @member1.dob)
  end

  def test_member_has_premium()
    assert_equal(false, @member1.premium)
  end

  # def test_check_age_over_16()
  #   @member1.check_age()
  #   assert_equal(32, @member1.check_age())
  # end
end
