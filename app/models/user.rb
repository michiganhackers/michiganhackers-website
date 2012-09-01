require "bcrypt"

class User < ActiveRecord::Base
  
  # Before Filters
  before_create do
    randomize_password if self[:password_hash].nil?
    generate_confirmation_hash if self[:confirmation_hash].nil?
  end
  
  # Attribute access
  attr_accessible :email, :user_type_id, :first_name, :last_name
  
  # Relationships
  belongs_to :user_type
  has_one :user_detail
  
  # Validation
  validates_uniqueness_of :email
  
  ### Static Methods ###
  
  def self.new_user_by_type type_name, user_data
    user_type = UserType.find_by_type_name type_name
    User.new user_data.merge user_type_id: user_type.id    
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
    randomize_password
    save!
  end
  
  def generate_confirmation_hash
    self[:confirmation_hash] = Digest::MD5.hexdigest rand(9999999999).to_s
  end
  
  def generate_confirmation_hash!
    generate_confirmation_hash
    save!
  end
end