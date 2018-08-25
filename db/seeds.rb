require_relative('../models/booking')
require_relative('../models/gymclass')
require_relative('../models/member')
require_relative('../models/personaltrainer')
require('pry-byebug')

Booking.delete_all()
GymClass.delete_all()
Member.delete_all()
PersonalTrainer.delete_all()


personaltrainer1 = PersonalTrainer.new({
  'name' => 'Filip Kuszenin',
  'description' => 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'
});

personaltrainer2 = PersonalTrainer.new({
  'name' => 'Cristiano Ronaldo',
  'description' => 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'
});

personaltrainer1.save()
personaltrainer2.save()

member1 = Member.new({
  'name' => 'Karim Benzema',
  'email' => 'karimbenzema@gmail.com',
  'phone' => '48730996420',
  'dob' => '12-04-1986',
  'premium' => false
});

member2 = Member.new({
  'name' => 'Marco Asensio',
  'email' => 'marcoasensio@gmail.com',
  'phone' => '48730996420',
  'dob' => '12-04-1996',
  'premium' => true
});

member3 = Member.new({
  'name' => 'Sergio Ramos',
  'email' => 'sergioramos@gmail.com',
  'phone' => '48730996420',
  'dob' => '12-04-1986',
  'premium' => true
  });

member4 = Member.new({
  'name' => 'James Rodriguez',
  'email' => 'jamesrodriguez@gmail.com',
  'phone' => '48730996420',
  'dob' => '12-04-2005',
  'premium' => true
  });

  member1.save()
  member2.save()
  member3.save()
  member4.save()

  gymclass1 = GymClass.new({
    'pt_id' => personaltrainer1.id,
    'name' => 'boxing',
    'capacity' => 20,
    'day_of_week' => 'monday',
    'hour' => '12:00'
  });

  gymclass2 = GymClass.new({
    'pt_id' => personaltrainer2.id,
    'name' => 'cardio',
    'capacity' => 2,
    'day_of_week' => 'thursday',
    'hour' => '12:00'
  });

  gymclass1.save()
  gymclass2.save()

  booking1 = Booking.new({
    'gymclass_id' => gymclass1.id,
    'member_id' => member1.id
  })

  booking1.save()

  binding.pry
  nil
