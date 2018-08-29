require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/booking')
require_relative('../models/gymclass')
require_relative('../models/member')
also_reload('../models/*')

require ("pry-byebug")


get '/bookings' do
  @bookings = Booking.all()
  @gymclasses = GymClass.all()
  @members = Member.all()
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
  redirect to ('bookings/new')
end

post '/bookings/:id/delete' do
  @booking = Booking.find_by_id(params['id'])[0]
  @booking.delete()
  redirect to '/bookings'
end
