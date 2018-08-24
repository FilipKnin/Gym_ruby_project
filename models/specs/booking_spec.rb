require("minitest/autorun")
require_relative("../booking")

class TestBooking < MiniTest::Test

  def setup
    @booking1 = Booking.new({'gymclass_id' => 1, 'member_id' => 2})
  end

  def test_Booking_has_gymclass_id()
    assert_equal(1, @booking1.gymclass_id)
  end

  def test_Booking_has_member_id()
    assert_equal(2, @booking1.member_id)
  end


end
