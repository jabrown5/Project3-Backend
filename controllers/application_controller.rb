class ApplicationController < Sinatra::Base

	@account_message = ""
	@username = ''



	require 'bundler'
	Bundler.require

  # NEW - - - - - -
  # - - - - - - - -

	# set :public_folder, File.expand_path('../../public', __FILE__)
	# set :views, File.expand_path('../../views', __FILE__)

	ActiveRecord::Base.establish_connection(
		:adapter => 'mysql2',
		:database => 'pottyproject'
	)

	register Sinatra::CrossOrigin
	configure do
		enable :cross_origin
	end

	enable :sessions, :logging  # is all it takes to enable sessions


	not_found do
		# erb :not_found	#404 page
		{:message => "not found"}.to_json

	end

	# ENABLING THIS TEMPORARILY TO MAKE SURE THINGS ARE WORKING
	def does_user_exist?(username)
		user = Account.find_by(:username => username.to_s)
		if user
			return true
		else
			return false
		end
	end

	# ENABLING THIS TEMPORARILY TO MAKE SURE THINGS ARE WORKING
	def is_not_authenticated
		p session
		session[:user].nil?	#bool
	end

	def does_key_work?(key)
		key_string = key.to_s
		user = Account.where(:api_key => key_string)
		if user != nil 
			return true
		else
			return false
		end
	end

  # ENABLING THIS TEMPORARILY TO MAKE SURE THINGS ARE WORKING
	get '/' do
		# erb :home
		{:message => "home page"}.to_json
	end

	before '/*' do
	  puts "Session Log:"
	  p session
	end

	after '/*' do
	  puts "Session Log:"
	  p session
	end

end