require_relative('../models/session.rb')
require_relative('../models/member.rb')
require_relative('../models/booking.rb')
require("pry-byebug")


Booking.delete_all()
Member.delete_all()
Session.delete_all()



member1= Member.new({'first_name' => 'Stine', 'last_name' => 'Slotsbo','gender' => 'female', 'age' => 40 })
member1.save()
member2= Member.new({'first_name' => 'Jiayi', 'last_name' => 'Qin', 'gender' => 'female', 'age' => 29 })
member2.save()
member3= Member.new({'first_name' => 'Andre', 'last_name' => 'Sanchez' ,'gender' => 'male', 'age' => 32 })
member3.save()
member4= Member.new({'first_name' => 'Kaamya', 'last_name' => 'Sharma', 'gender' => 'male', 'age' => 28 })
member4.save()
member5= Member.new({'first_name' => 'Ram', 'last_name' => 'Vel', 'gender' => 'male', 'age' => 32 })
member5.save()



session1= Session.new({'session_name' => 'HIIT', 'type' => 'Cardio','start_time' => '2017-01-08 04:00:00'})
session1.save()
session2= Session.new({'session_name' => 'Abs', 'type' => 'Core', 'start_time' => '2017-01-09 05:00:00'})
session2.save()
session3= Session.new({'session_name' => 'Boxing', 'type' => 'Cardio' ,'start_time' => '2017-01-10 07:00:00'})
session3.save()
session4= Session.new({'session_name' => 'Tabata', 'type' => 'Cardio' ,'start_time' => '2017-01-11 08:00:00'})
session4.save()
session5= Session.new({'session_name' => 'Body-weight', 'type' => 'strength-training', 'start_time' => '2017-01-12 10:00:00'})
session5.save()

booking1 = Booking.new({"member_id" => member1.id,"session_id" => session1.id})
booking1.save()
booking2 = Booking.new({"member_id" => member2.id,"session_id" => session2.id})
booking2.save()
booking3 = Booking.new({"member_id" => member3.id,"session_id" => session3.id})
booking3.save()
booking4 = Booking.new({"member_id" => member4.id,"session_id" => session4.id})
booking4.save()
booking5 = Booking.new({"member_id" => member5.id,"session_id" => session5.id})
booking5.save()



binding.pry
nil
