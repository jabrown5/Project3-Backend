require 'sinatra/base'
require 'sinatra/cross_origin'


# require './app' #requires app.rb

# run Sinatra::Application #starts server

#require controllers

require './controllers/application_controller'
require './controllers/account_controller'
require './controllers/comment_controller'
require './controllers/restroom_controller'

#require models BEFORE we map them
require './models/account'
require './models/comment'
require './models/restroom'


#run has to match class name in the respective controller
#this is the same as app.use('/puppy', puppymodule)

map('/') { run  ApplicationController}
map('/api/account') { run AccountController}
map('/api/comment') { run CommentController}
map('/api/restroom') { run RestroomController}



# life is good?
# before/after filter
