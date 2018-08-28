require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/member.rb' )
also_reload( '../models/*' )
require('pry')


get '/members' do
  @members = Member.all()
  erb (:'members/index')
end

get '/members/new' do
  erb(:'members/new') #does not work with a date format.
end

post '/members' do
  member = Member.new(params)
  member.save()
  erb(:'members/create')
end

get '/members/:id' do
  @member = Member.find_by_id(params['id'].to_i())
  erb(:'members/show')
end

post '/members/:id' do
  Member.new(params).update
  redirect to '/members'
end
