require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( 'controllers/products_controller.rb' )
require_relative( 'controllers/suppliers_controller.rb' )
also_reload( '../models/*' )

get '/' do
  erb ( :"index" )
end
