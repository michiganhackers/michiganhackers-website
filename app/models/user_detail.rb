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
  
  # Relations
  belongs_to :user
  
  # Property Assignment - DB props
  attr_accessible :concentration, :personal_url, :github_handle, :graduation_date
  
  # Property Assignment - Virtal properties (Needed so that the mass-assign will work)
  attr_accessible :grad_month, :grad_year
  
  # Setting the grad month
  # The [val + 1] is used since Time.new's "month" is not zero-based
  def grad_month=(val)
    @grad_month = (val.to_i + 1) unless val.empty?
    update_graduation_date
  end

  # The [val - 1] is used since Time.new's "month" is not zero-based  
  def grad_month
    @grad_month - 1 unless @grad_month.nil?
  end
  
  # Setting the grad year
  def grad_year=(val)
    @grad_year = val unless val.empty?
    update_graduation_date
  end
  
  def grad_year
    @grad_year
  end
  
  # @param val - should be of type "Time"
  def graduation_date=(val)
    self[:graduation_date] = Time.new (@grad_year=val.year), (@grad_month=val.month)
  end
  
  def graduation_date
    Time.new self[:graduation_date].year, self[:graduation_date].month
  end
  
  private
  
  def update_graduation_date
    unless @grad_month.nil? or @grad_year.nil?
      self[:graduation_date] = Time.new(@grad_year, @grad_month)
    end
  end
  
end