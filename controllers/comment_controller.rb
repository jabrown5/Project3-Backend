class CommentController < ApplicationController

  get '/' do
    p session
    Comment.all.to_json

    # @model = Blog.all
    # @model.to_json
  end

  get '/:id' do
    @id = params[:id]
    Comment.find(@id).to_json

    # @model = Blog.find(params[:id])
    # @model.to_json
  end

  post '/' do

    api_key  = params[:api_key]

    if api_key == 'catscatscatscats'

        @model = Comment.new
        @model.comment  = params[:comment]
        @model.publicly_accessible = params[:publicly_accessible]
        @model.cleanliness      = params[:cleanliness]
        @model.family_friendly  = params[:family_friendly]
        @model.gender           = params[:gender]
        @model.user_submission  = params[:user_submission]
        @model.date  = params[:date]
        @model.pictures  = params[:pictures]
        @model.tags  = params[:tags]
        # @model.foreign_key  = params[:foreign_key]
        @model.restroom_id = params[:restroom_id]

        @model.save
        @model.to_json

        @account_message = "Your submission was successful. Please take a look..."
        return {:message => @account_message }.to_json

    # else {:status => 403}.to_json
    else
        @account_message = "You do not have authorization to post. Please register"
        return {:message => @account_message, :status => 403 }.to_json
    end

  end

  patch '/:id' do
    api_key  = params[:api_key]

    if api_key == 'catscatscatscats'  

        @id = params[:id]

        @comment  = params[:comment]
        @publicly_accessible = params[:publicly_accessible]
        @cleanliness      = params[:cleanliness]
        @family_friendly  = params[:family_friendly]
        @gender           = params[:gender]
        @user_submission  = params[:user_submission]
        @date       = params[:date]
        @pictures   = params[:pictures]
        @tags       = params[:tags]
        # @foreign_key= params[:foreign_key]
        @restroom_id= params[:restroom_id]

        @new_row = Comment.find(@id)
        @new_row.comment  = @comment
        @new_row.publicly_accessible  = @publicly_accessible
        @new_row.cleanliness      = @cleanliness
        @new_row.family_friendly  = @family_friendly
        @new_row.gender           = @gender
        @new_row.user_submission  = @user_submission
        @new_row.date      = @date
        @new_row.pictures  = @pictures
        @new_row.tags         = @tabs
        # @new_row.foreign_key  = @foreign_key
        @new_row.restroom_id  = @restroom_id

        @new_row.save
        @new_row.to_json

        @account_message = "Your submission was successful. Please take a look..."
        return {:message => @account_message }.to_json
      
    # else {:status => 403}.to_json
    else
        @account_message = "You do not have authorization to post. Please register"
        return {:message => @account_message, :status => 403 }.to_json
    end

  end

  delete '/:id' do
    api_key  = params[:api_key]

    if api_key == 'catscatscatscats' 

        @id = params[:id]
        @model = Comment.find(@id)
        @model.destroy
        @account_message = "You've deleted this potty posting COMMENT."
        return {:message => @account_message }.to_json
      
    # else {:status => 403}.to_json
    else
        @account_message = "You do not have authorization to delete. Please register"
        return {:message => @account_message, :status => 403 }.to_json
    end

  end

end