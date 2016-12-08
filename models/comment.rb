class Comment < ActiveRecord::Base 
# (self.table_name = 'comment') we don’t need this bc it already knows
  self.table_name = 'comments'


  # belongs_to :restoom, through: :restroom_comments
  belongs_to :restoom #, foreign_key: :restroom_comments

end