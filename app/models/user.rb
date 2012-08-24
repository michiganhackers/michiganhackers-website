class User < ActiveRecord::Base
  
  has_one :user_type
  
  def self.new_user_by_type user_type, user_data
    user_type = UserType.find_by_type_name user_type[:type_name]
    User.new user_data.merge user_type_id: user_type.id
  end
  
end