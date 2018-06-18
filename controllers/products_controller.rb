require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( '../models/product.rb' )
require_relative( '../models/shop.rb' )
require_relative( '../models/supplier.rb' )
also_reload( '../models/*' )

get '/products/show-all' do
  @products = Product.all() #array of hashes
  erb ( :"products/index" )
end

get '/products/new' do
  @products = Product.all
  erb ( :"products/new" )
end


post '/products/show-all' do
  @product = Product.new( params )
  @product.save()
  erb( :"products/create" )
end

get '/products/:id/edit' do
  @product = Product.find(params[:id])
  erb(:"products/edit")
end

post '/products/:id' do
  Product.new(params).update
  redirect '/products/show-all'
end
