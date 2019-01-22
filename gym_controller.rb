require( 'sinatra' )
require( 'sinatra/reloader' ) if development?
require( 'pry' )
require_relative('./models/member')
require_relative('./models/session')
require_relative('./models/booking')
require_relative('./controllers/member_controller')
require_relative('./controllers/session_controller')
require_relative('./controllers/booking_controller')



get '/' do
  erb(:home)
end
