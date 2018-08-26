require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/member.rb' )
also_reload( './models/*' )


get '/members' do
  @members = Member.all()
  erb (:"members/index")
end


# get '/zombies' do
#   @zombies = Zombie.all()
#   erb ( :"zombies/index" )
# end
