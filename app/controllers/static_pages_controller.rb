class StaticPagesController < ApplicationController

  # Config for CS EDU Week
  CS_EDU_QS = YAML.load_file(Rails.root.join("config/cseducation_questions.yml"))
  # Start Date for CS EDU Week
  CS_EDU_START = Time.new 2012, 12, 03, 8

  # Before filter to trigger the countdown if the date is not upon us!
  before_filter :cseducation_date_check, only: [:cseducation, :cseducation_submit, :cseducation_process, :cseducation_leaderboard]

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

  def cseducation_countdown
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
  end
  
  private
  
  def cseducation_date_check
    redirect_to cs_edu_countdown_path if Time.now < CS_EDU_START
  end
  
end
