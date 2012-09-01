class UserDetail < ActiveRecord::Base
  
  # Undergrad
  CS_UG_CONCENTRATION = "ug_cs"
  CE_UG_CONCENTRATION = "ug_ce"
  EE_UG_CONCENTRATION = "ug_ee"
  
  # Graduate
  CS_MS_CONCENTRATION = "ms_cs"
  CE_MS_CONCENTRATION = "ms_ce"
  EE_MS_CONCENTRATION = "ms_ee"
  
  # Non-CoE
  LSA_CS_CONCENTRATION = "lsa_cs"
  SI_UG_CONCENTRATION = "ug_si"
  SI_MS_CONCENTRATION = "ms_si"
  
  belongs_to :user
  
end