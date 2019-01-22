require('pry')
require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/booking.rb' )
require_relative( '../models/member.rb' )
require_relative( '../models/session.rb' )
also_reload( '../models/*' )

get '/bookings/new' do
  @member = Member.find(params['member_id'].to_i)
  @sessions = Session.all()
  erb(:"bookings/new")
end

get '/bookings' do
  @booking = Booking.all()
  erb(:"bookings/index")
end

post '/bookings' do
  p params
  @booking = Booking.new(params)
  @booking.save
  redirect to ("/members")
  binding.pry
  # Create a new Booking object and save to # DB
  # Redirect to members index
end
