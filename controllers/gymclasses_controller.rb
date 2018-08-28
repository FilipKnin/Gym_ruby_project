require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/gymclass')
also_reload('../models/*')


get '/gymclasses' do
  @gymclasses = GymClass.all()
  erb(:'gymclasses/index')
end

get '/gymclasses/new' do
  erb(:'gymclasses/new')
end

post '/gymclasses' do
  newgymclass = GymClass.new(params)
  newgymclass.save()
  erb(:'gymclasses/create')
end

get '/gymclasses/:id' do
  @gymclass = GymClass.find_by_id(params['id'].to_i())
  erb(:'gymclasses/show')
end

get '/gymclasses/:id/edit' do
  @gymclass = GymClass.find_by_id(params['id'])
  erb(:'gymclasses/edit')
end

post '/gymclasses/:id' do
  GymClass.new(params).update
  redirect to '/gymclasses'
end
