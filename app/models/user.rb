require "bcrypt"

class User < ActiveRecord::Base

  # Attribute access
  attr_accessible :email, :user_type_id

  # Relationships
  has_one :user_type
  
  # Validation
  validates_uniqueness_of :email
  
  ### Static Methods ###
  
  def self.new_user_by_type type_name, user_data
    user_type = UserType.find_by_type_name type_name
    user = User.new user_data.merge user_type_id: user_type.id
    user.randomize_password
    
    return user
  end
  
  ### Instance Methods ###
  
  def password=(plain_pass)
    @password = BCrypt::Password.create plain_pass
    self[:password_hash] = @password
  end
  
  def password
    @password ||= BCrypt::Password.new self[:password_hash]
  end
  
  def randomize_password
    self.password = Digest::MD5.hexdigest rand(9999999999).to_s
  end

  def randomize_password!
    self.password = Digest::MD5.hexdigest rand(9999999999).to_s
    save!
  end
  
end