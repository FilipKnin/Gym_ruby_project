require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/booking')
require_relative('../models/gymclass')
require_relative('../models/member')
also_reload('../models/*')


get '/bookings' do
  erb(:'bookings/index')
end

get '/bookings/new' do
  @gymclasses = GymClass.all()
  @members = Member.all()
  erb(:'bookings/new')
end

post '/bookings' do
  newbooking = Booking.new(params)
  newbooking.save()
  redirect to ('/bookings')  
end
