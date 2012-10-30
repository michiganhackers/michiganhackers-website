# Initialization
Authorization.default_role = :guest

# General Privileges
privileges do
  # Auth and Deauth
  privilege :authorize, includes: [:login]  
  privilege :deauthorize, includes: [:logout]
end

authorization do

  # If a user is not authorized the he/she is a guest, in *all* cases
  # Please ensure that future changes do not special case this rule
  role :guest do
    has_permission_on :users, to: :authorize
  end
  
  # Base type for active, authorized users
  role :active_user do
    has_permission_on :users, to: :deauthorize
    has_permission_on :users, to: :manage_account
  end
  
  role :student do
    includes :active_user
  end
  
end