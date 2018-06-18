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

post '/suppliers/:id/delete' do
  supplier = Supplier.find( params[:id] )
  supplier.delete()
  redirect to '/suppliers/show-all'
end

post '/suppliers/:id' do
  Supplier.new(params).update
  redirect '/suppliers/show-all'
end

get '/suppliers/new' do
  @suppliers = Supplier.all
  erb ( :"suppliers/new")
end

post '/suppliers' do
  @supplier = Supplier.new(params)
  @supplier.save()
  redirect '/suppliers/show-all'
end
