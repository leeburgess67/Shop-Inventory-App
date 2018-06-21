require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( '../models/product.rb' )
require_relative( '../models/shop.rb' )
require_relative( '../models/supplier.rb' )
also_reload( '../models/*' )

#INDEX
get '/suppliers' do
  @suppliers = Supplier.all()
  erb ( :"suppliers/index")
end

#EDIT
get '/suppliers/:id/edit' do
  @supplier = Supplier.find(params[:id])
  erb ( :"suppliers/edit" )
end

#NEW
get '/suppliers/new' do
  @suppliers = Supplier.all
  erb ( :"suppliers/new")
end

#DESTROY
post '/suppliers/:id/delete' do
  supplier = Supplier.find( params[:id] )
  supplier.delete()
  redirect to '/suppliers'
end

#CREATE
post '/suppliers' do
  @supplier = Supplier.new(params)
  @supplier.save()
  redirect '/suppliers'
end

#UPDATE
post '/suppliers/:id' do
  Supplier.new(params).update
  redirect '/suppliers'
end
