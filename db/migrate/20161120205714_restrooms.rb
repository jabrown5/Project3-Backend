class Restrooms < ActiveRecord::Migration[5.0]
  def change
    create_table :restrooms do |table|
      table.string :facility_name
      table.string :address
      table.string :latitude
      table.string :longitude
      table.string :publicly_accessible
      table.string :cleanliness
      table.string :family_friendly
      table.string :gender
      table.string :user_submission
      # table.string :comments_id, :foreign_key :co, :null => false
      table.timestamps 

    end
  end
end