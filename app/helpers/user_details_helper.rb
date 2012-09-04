module UserDetailsHelper
  
  def concentration_options
    {
      "EECS Undergraduate" => 
        [
          ["Computer Science", UserDetail::CS_UG_CONCENTRATION], 
          ["Computer Engineering", UserDetail::CE_UG_CONCENTRATION], 
          ["Electrical Engineering", UserDetail::EE_UG_CONCENTRATION]
        ],
      "EECS Graduate" => 
        [
          ["Computer Science", UserDetail::CS_MS_CONCENTRATION], 
          ["Computer Engineering", UserDetail::CE_MS_CONCENTRATION],
          ["Electrical Engineering", UserDetail::EE_MS_CONCENTRATION]
        ],
      "Non-EECS" => 
        [
          ["LSA Computer Science", UserDetail::LSA_CS_CONCENTRATION], 
          ["School of Information | Undergrad", UserDetail::SI_UG_CONCENTRATION],
          ["School of Information | Graduate", UserDetail::SI_MS_CONCENTRATION],
          ["Other (Manual Entry)", "other"],
        ]
    }
  end

  # Dynamically generate the values which correspond to each month
  def grad_month_options
    @months ||= (@months = [
      "January", "February", "March", "April", "May", "June",
      "July", "August", "September", "October", "November", "December",
    ]).each_index { |idx| @months[idx] = [@months[idx], idx] }
    @months.unshift ["", nil]
  end
  
  # Dynamically generate the array, looking ahead 6 years
  def grad_year_options
    cur_year = Time.now.year
    @years ||= (@years = Array.new 7).each_index { |idx| @years[idx] = cur_year + idx }
    @years.unshift ["", nil]
  end
  
end