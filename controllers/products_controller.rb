require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( '../models/product.rb' )
require_relative( '../models/shop.rb' )
require_relative( '../models/supplier.rb' )
also_reload( '../models/*' )

# TODO: refactor for /products
get '/products/show-all' do
  @products = Product.all()
  @suppliers = Supplier.all()
  erb ( :"products/index" )
end

get '/products/new' do
  @products = Product.all
  @suppliers = Supplier.all()
  erb ( :"products/new" )
end

post '/products/:id/delete' do
  product = Product.find( params[:id] )
  product.delete()
  redirect to '/products/show-all'
end

# TODO: refactor for /products
post '/products/show-all' do
  @product = Product.new( params )
  @product.save()
  erb( :"products/create" )
end

get '/products/:id/edit' do
  @product = Product.find(params[:id])
  @suppliers = Supplier.all()
  erb(:"products/edit")
end

post '/products/:id' do
  @product = Product.find(params[:id])
  result = @product.sold(params[:qty])
  Product.new(params).update
  redirect '/products/show-all'
end

post '/products/:id/sell' do
  product = Product.find(params[:id].to_i)
  product.sell(params[:qty].to_i)
  redirect '/products/show-all'
end
