require("minitest/autorun")
require_relative("../gymclass")
require_relative("../personaltrainer")

class TestGymClass < MiniTest::Test

  def setup
    @personaltrainer1 = PersonalTrainer.new({'name' => 'Filip Kuszenin','description' => 'test_text'});
    @gymclass1 = GymClass.new({'pt_id' => 5,'name' => 'boxing','capacity' => 20, 'day_of_week' => 'Monday', 'hour' => '12:00'});
    @gymclass2 = GymClass.new({'pt_id' => 5,'name' => 'boxing','capacity' => 1, 'day_of_week' => 'Monday', 'hour' => '12:00'});
  end

  def test_GymClass_has_pt_id()
    assert_equal(5, @gymclass1.pt_id )
  end

  def test_GymClass_has_name()
    assert_equal('boxing', @gymclass1.name )
  end

  def test_GymClass_has_capacity()
    assert_equal(20, @gymclass1.capacity )
  end

  def test_GymClass_has_day_of_week()
    assert_equal('monday', @gymclass1.day_of_week )
  end

  def test_GymClass_has_hour()
    assert_equal('12:00', @gymclass1.hour )
  end

  def test_check_space_under_limit
    @gymclass2.check_space(0)
    assert_equal(true, @gymclass2.check_space(0))
  end

  def test_check_space_over_limit
    @gymclass2.check_space(1)
    assert_equal(false, @gymclass2.check_space(1))
  end

end
