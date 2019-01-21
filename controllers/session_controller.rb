require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/member.rb' )
require_relative( '../models/session.rb' )
require_relative( '../models/booking.rb' )
also_reload( '../models/*' )

get '/sessions' do
  @sessions = Session.all()
  erb ( :"sessions/index" )
end


get '/sessions/new' do
 erb(:"sessions/new")
end

get '/sessions/:id' do
  @session = Session.find(params['id'].to_i)
  erb( :"sessions/show" )
end

get '/sessions/:id/edit' do
  @session = Session.find(params['id'])
  erb(:"sessions/edit")
end
