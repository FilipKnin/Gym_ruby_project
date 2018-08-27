require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/gymclass')
also_reload('../models/*')


get '/gymclasses' do
  @gymclasses = GymClass.all()
  erb(:'gymclasses/index')
end

get '/gymclasses/:id' do
  @gymclass = GymClass.find_by_id(params['id'].to_i())
  erb(:'gymclasses/show')
end
