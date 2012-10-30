require "bcrypt"
require "umich_ldap/umich_ldap"

class User < ActiveRecord::Base
  
  # Before Filters
  before_create do
    randomize_password if self[:password_hash].nil?
    generate_confirmation_hash if self[:confirmation_hash].nil?
  end
  
  after_create do |record|
    UserMailer.new_student_user(record).deliver if record.is_student?
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
  
  def self.new_from_uniqname!(uniqname)
   
    # Raises an exception if the entry is not found
    name_parts = UmichLDAP::get_name_parts_by_uniqname(uniqname)
    
    user = User.new name_parts.merge({email: "#{uniqname}@umich.edu"})
    user.user_type = UserType.find_by_type_name "student"
    
    return user if user.save
  end
  
  ### Instance Methods ###
  def uniqname
    return nil if email.nil?
    (match = email.match(/(\w+)@umich\.edu/)) ? match.captures.first : nil
  end
  
  def set_fullname_from_ldap
    return if uniqname.nil?

    # This will always succeed
    name_parts = UmichLDAP::get_name_parts_by_uniqname(uniqname)
    
    self[:first_name] = name_parts[:first_name]
    self[:last_name] = name_parts[:last_name]
  end
  
  def fullname
    "#{first_name} #{last_name}" unless first_name.nil? or last_name.nil?
  end
  
  def is_student?
    not user_type.nil? and user_type.type_name == "student" 
  end
  
  def role_symbols
    [user_type.type_name.to_sym]
  end
  
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