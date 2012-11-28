class CseducationAnswer < ActiveRecord::Base
  
  # The number of trivia questions
  NUM_QUESTIONS = 4
  
  attr_accessible :uniqname, :value, :qid
  
  def self.persist_answer(cand, ques)
    # If the user has already answered, do not double count
    return unless CseducationAnswer.find_by_uniqname_and_qid(cand[:uniqname], cand[:qid]).nil?
    CseducationAnswer.new({uniqname: cand[:uniqname], value: ques["val"], qid: cand[:qid]}).save
  end
  
  def self.get_leaderboard()
    
    # Build the ordered results array
    results = CseducationAnswer.sum(:value, group: :uniqname).to_a.sort do |e1, e2| 
      # Check if the sums are equal    
      if e1[1] == e2[1]
        # Use the string ordering
        e2[0] <=> e1[0]
      else
        # Use the number of ones to sort
        e1_count = e1[1].to_s.split("").count(1)
        e2_count = e2[1].to_s.split("").count(1)
        # Use the one with the most ones, else the one with the higher value    
        e1_count == e2_count ? e2[1] <=> e1[1] : e2_count <=> e1_count    
      end
    end
    
    # Map the question numbers into question answered - unanswered values
    results.map do |e|
      # Split the number into a char array
      e_new = e[1].to_s.split("").reverse
      e_new.concat(Array.new(NUM_QUESTIONS - e_new.count, 0)) if e_new.count < NUM_QUESTIONS
      e[1] = e_new.map {|e| e == "1" }
      e
    end
  end
  
end