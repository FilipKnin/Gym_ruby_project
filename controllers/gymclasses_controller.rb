require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/gymclass')
also_reload('../models/*')


get '/gymclasses' do
  @gymclasses = GymClass.all()
  erb(:'gymclasses/index')
end
