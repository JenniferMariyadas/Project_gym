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

delete '/members/:id' do # delete
  @member = Member.find( params[:id] )
  @member.delete
  redirect to '/members'
end


get '/members/new' do
  erb(:"members/new")
end

post '/members' do
  Member.new( params ).save
  redirect to '/members'
end

get '/members/:id' do
  @member = Member.find(params['id'].to_i)
  erb( :"members/show" )
end

get '/members/:id/edit' do
  @member = Member.find(params['id'])
  erb(:"members/edit")
end

put '/members/:id' do
  @member = Member.new(params)
  @member.update()
  redirect to '/members'
end
