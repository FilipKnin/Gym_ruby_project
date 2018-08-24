require("minitest/autorun")
require_relative("../personaltrainer")

class TestPersonalTrainer < MiniTest::Test

  def setup
    @personaltrainer1 = PersonalTrainer.new({
      'name' => 'Filip Kuszenin',
      'description' => 'test_text'
    })
  end

  def test_personal_trainer_has_name()
    assert_equal('Filip Kuszenin', @personaltrainer1.name)
  end

  def test_personal_trainer_has_description()
    assert_equal('test_text', @personaltrainer1.description)

  end

end
