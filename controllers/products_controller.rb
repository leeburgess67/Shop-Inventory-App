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
  @shop = Shop.new(@products)
  erb ( :"products/index" )
end

get '/products/new' do
  @products = Product.all
  @suppliers = Supplier.all()
  erb ( :"products/new" )
end

get '/products/:id/edit' do
  @product = Product.find(params[:id])
  @suppliers = Supplier.all()
  erb(:"products/edit")
end

get "/products/search" do
  @products = Product.all
  erb (:'products/search')
end

get "/products/search" do
  @products = Product.all
  erb (:'products/search')
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

post '/products/:id/sell' do
  product = Product.find(params[:id].to_i)
  product.sell(params[:qty].to_i)
  redirect '/products'
end

post "/products/search" do
  @product = Product.find_by_upn(params['upn'])
  if @product
    erb ( :"/products/show" )
  else
    erb ( :"/products/not_found")
  end
end

post '/products/:id' do
  @product = Product.find(params[:id])
  Product.new(params).update
  redirect '/products'
end

post '/products/:id/check-stock' do
  product = Product.find(params[:id])
  Product.new(params).update
  redirect '/products'
end

post '/products/:id/delivered' do
  product = Product.find(params[:id].to_i)
  product.delivered(params[:delivered].to_i)
  redirect '/products'
end
