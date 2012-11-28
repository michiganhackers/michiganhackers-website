class StaticPagesController < ApplicationController

  CS_EDU_QS = YAML.load_file(Rails.root.join("config/cseducation_questions.yml"))


  def home
    @upcoming_events = Event.upcoming_events.slice(0,2)
  end

  def error
  end

  def sponsors
  end
  
  def cseducation
    # Nothing to do if the main page is hit or the qid is invalid
    return if params[:qid].nil?
    
    # Render the "cseducation_question" page if the qid is valid
    render "cseducation_question" unless (@question = CS_EDU_QS[params[:qid]]).nil?
  end

  def cseducation_submit
  end

  def cseducation_process
    candidate = params[:question]
    question = CS_EDU_QS[candidate[:qid]]
    
    # Redirect if the conditions are not met
    redirect_to cs_edu_submit_path and return if question.nil?
    redirect_to cs_edu_submit_path and return if question["ans"] != candidate[:answer]
  
    # Create a new answer 
    
    # Save the answer and redirect back to the leader board
    CseducationAnswer.persist_answer candidate, question
    redirect_to cs_edu_leaderboard_path and return
  end

  def cseducation_leaderboard
    @leaderboard = CseducationAnswer.get_leaderboard
    pp @leaderboard
  end
  
end
