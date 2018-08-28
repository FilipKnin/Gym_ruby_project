require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/gymclass')
require_relative('../models/personaltrainer')
also_reload('../models/*')


get '/gymclasses' do
  @gymclasses = GymClass.all()
  erb(:'gymclasses/index')
end

get '/gymclasses/new' do
  @personaltrainers = PersonalTrainer.all
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
  @personaltrainers = PersonalTrainer.all
  erb(:'gymclasses/edit')
end

post '/gymclasses/:id' do
  GymClass.new(params).update
  redirect to '/gymclasses'
end

post '/gymclasses/:id/delete' do
  @gymclass = GymClass.find_by_id(params['id'])
  @gymclass.delete
  redirect to '/gymclasses'
end
