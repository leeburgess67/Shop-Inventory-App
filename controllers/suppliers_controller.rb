require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( '../models/product.rb' )
require_relative( '../models/shop.rb' )
require_relative( '../models/supplier.rb' )
also_reload( '../models/*' )


get '/suppliers/show-all' do
  @suppliers = Supplier.all()
  erb ( :"suppliers/index")
end

get '/suppliers/:id/edit' do
  @supplier = Supplier.find(params[:id])
  erb ( :"suppliers/edit" )
end

post '/suppliers/:id' do
  Supplier.new(params).update
  redirect '/suppliers/show-all'
end
