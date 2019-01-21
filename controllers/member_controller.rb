require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/member.rb' )
require_relative( '../models/session.rb' )
require_relative( '../models/booking.rb' )
also_reload( '../models/*' )

get '/members' do
  @members = Member.all()
  erb ( :"members/index" )
end


get '/members/new' do
 erb(:"members/new")
end

get '/members/:id/book'
@member = Member.find(params['id'].to_i)
@members = Member.all()
erb(:"bookings/new") do
end

get '/members/:id' do
  @member = Member.find(params['id'].to_i)
  erb( :"members/show" )
end

get '/members/:id/edit' do
  @member = Member.find(params['id'])
  erb(:"members/edit")
end
