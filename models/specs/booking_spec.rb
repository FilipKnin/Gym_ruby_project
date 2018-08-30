require("minitest/autorun")
require_relative("../booking")
require_relative("../member")
require_relative("../personaltrainer")
require_relative("../gymclass")

class TestBooking < MiniTest::Test

  def setup
    @booking1 = Booking.new({'gymclass_id' => 1, 'member_id' => 2});
    @gymclass1 = GymClass.new({'id' =>1, pt_id => 5,'name' => 'boxing','capacity' => 1, 'day_of_week' => 'Monday', 'hour' => '12:00'});
  end

  def test_Booking_has_gymclass_id()
    assert_equal(1, @booking1.gymclass_id)
  end

  def test_Booking_has_member_id()
    assert_equal(2, @booking1.member_id)
  end

  def test_add_booking()
    @booking1(@gymclass1)

  end

end
