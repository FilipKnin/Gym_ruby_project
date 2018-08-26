require('sinatra')
require( 'sinatra/contrib/all' ) #why we require this?
require_relative('controllers/gymclasses_controller')
require_relative('controllers/gyms_controller')
require_relative('controllers/members_controller')
require_relative('controllers/personaltrainers_controller')

get '/' do
  erb( :index )
end
