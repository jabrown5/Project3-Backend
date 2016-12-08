class Account < ActiveRecord::Base 
# (self.table_name = 'account') we don’t need this bc it already knows
  self.table_name = 'accounts'

end