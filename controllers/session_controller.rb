require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/member.rb' )
require_relative( '../models/session.rb' )
require_relative( '../models/booking.rb' )
also_reload( '../models/*' )

get '/sessions' do
  @sessions = Session.all()
  erb ( :"/sessions/index" )
end

delete '/sessions/:id' do
  @session = Session.find(params[:id])
  @session.delete
  redirect to '/sessions'
end

get '/sessions/new' do
  erb(:"/sessions/new")
end

post '/sessions' do
  session = Session.new(params)
  session.save()
  redirect to '/sessions'
end

get '/sessions/:id' do
  @session = Session.find(params['id'].to_i)
  @members = @session.member
  erb( :"/sessions/show" )
end

# get '/sessions/:id/members' do
#   @session = Session.find(params['id'].to_i)
#   @members = @session.member
#   erb( :"/members/index")
# end

get '/sessions/:id/edit' do
  @session = Session.find(params['id'])
  erb(:"/sessions/edit")
end

put '/sessions/:id' do
  @session = Session.new(params)
  @session.update()
  redirect to '/sessions'
end
