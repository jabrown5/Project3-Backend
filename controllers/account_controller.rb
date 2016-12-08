class AccountController < ApplicationController

	@username = ''

	get '/' do
		p session
		Account.all.to_json
		# login/registration page
		# erb :login


	end

	post '/' do
		# accept the params from a post
		# to create a user
		# hint: bcrypt
		p params

		@username = params[:username]

		p @username
		@password = params[:password]
		@email = params[:email]


		if does_user_exist?(@username) == true
			# @account_message = "User already exists."
			# # return erb :login_notice
			# 	return {:message => @account_message }.to_json
			@account_message = "An account with that username already exists. Please choose a new username."
			return {:message => @account_message, :status => 403 }.to_json

		else
			password_salt = BCrypt::Engine.generate_salt
			password_hash = BCrypt::Engine.hash_secret(@password, password_salt)

			@model = Account.new


			@model.username = @username
			@model.email = @email
			# @model.password_hash = password_hash
			# @model.password_salt = password_salt
	    	@model.password_hash = password_hash
	   		@model.password = password_salt
	   		@model.api_key = 'catscatscatscats' # set api key to 'cats'

	    	@model.save

			@account_message = "Welcome. You've successfully registered and are now logged in."
			# @username = session[:user][:username]
			return {:message => @account_message, :api_key => 'catscatscatscats' , :username => @username}.to_json

   			# return @model.to_json
		end

	end



	post '/login' do

		# puts session
		# params { :username, :password, :email }
		@username = params[:username]
		@password = params[:password]
		@api_key = params[:api_key]
		# accept params from a post
		# to check if a user exists
		# and if so, log them in
		if does_user_exist?(@username) == false
			@account_message = "No user with that user name exists. Please try again or register a new account."
				return {:message => @account_message, :status => 403}.to_json
			#binding.pry
			# return erb :login_notice
		else
	        @model = Account.where(:username => @username).first
	        @password = BCrypt::Engine.hash_secret(params[:password], @model.password_hash)
	       
	        if @password == @model.password_hash
				@account_message = "Welcome back!"
				return {:message => @account_message, :api_key => 'catscatscatscats', :username => @username }.to_json
				# return {:message => @account_message }.to_json

		        # UPON SUCCESSFUL LOGIN, SENDING USER INFO TO CLIENT SIDE
		        # @model.to_json
		        # - - - - - - - - - - - - - - - - - - - - - - - -
			else
				@account_message = "Your password is incorrect. Please try again."
				# return @model.to_json
				return {:message => @account_message, :status => 403}.to_json
			end
        

		end

		# session[:user] = @username
		# p session
		# { :message => 'New session enabled.'}.to_json


		# #binding.pry
		# @model = Account.where(:username => @username).first!
		# if @model.password_hash == BCrypt::Engine.hash_secret(@password, @model.password)
		# 	@account_message = "Welcome back!"
		# 	session[:user] = @model

		# 	@username = session[:user][:username]
		# 	#binding.pry

		# 	# return erb :login_notice
		# else
		# 	@account_message = "Sorry, you password did not match. Try again?"
		# 	# return erb :login_notice
		# end

   		# @model.to_json


	end

	get '/logout' do
		# user peaces out
		# set session to nil
		# they will then need to login again
		p session
		session[:user] = nil

		@username = nil
		@password = nil
		@api_key = nil

		# @username = nil
		# redirect '/'

		@account_message = "You've been logged out."
		# return @model.to_json
		return {:message => @account_message, :status => 403, :api_key => '' , :username => @username }.to_json
	end

end