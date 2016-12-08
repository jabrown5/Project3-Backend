class Restroom < ActiveRecord::Base 
# (self.table_name = 'restroom') we don’t need this bc it already knows 
  self.table_name = 'restrooms'

  # has_many :comments, through: :restroom_comments
  has_many :comments

  	# looking at comments table, there are MANY comments,
  	# connections are made via the "restroom_comments" table
end


#@user = Account.find(params[:id])
#@user.comments 
# or...
#Comment.where(:account => params[:id])