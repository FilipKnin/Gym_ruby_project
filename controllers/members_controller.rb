require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/member.rb' )
also_reload( '../models/*' )


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

# post '/pizza-orders/:id' do # update
#   PizzaOrder.new( params ).update
#   redirect to '/pizza-orders'
# end


get '/members/:id' do
  @member = Member.find_by_id(params['id'].to_i())
  erb(:'members/show')
end
