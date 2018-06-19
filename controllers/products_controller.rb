require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( '../models/product.rb' )
require_relative( '../models/shop.rb' )
require_relative( '../models/supplier.rb' )
also_reload( '../models/*' )


get '/products' do
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
  redirect to '/products'
end


post '/products' do
  @product = Product.new( params )
  @product.save()
  redirect '/products'
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
  redirect '/products'
end

post '/products/:id/sell' do
  product = Product.find(params[:id].to_i)
  product.sell(params[:qty].to_i)
  redirect '/products'
end

post '/products/:id/delivered' do
  product = Product.find(params[:id].to_i)
  product.delivered(params[:delivered].to_i)
  redirect '/products'
end

get '/stockholding' do
  items = Product.all()
  @shop = Shop.new(items)
  @shop.stockholding_value_cost_price
  @shop.stockholding_value_retail_price
  erb ( :'KPI/index' )
end
