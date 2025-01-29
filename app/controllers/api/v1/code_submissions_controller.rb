class Api::V1::CodeSubmissionsController < ApplicationController
  def index
  end

  def create
    puts "this is getting hit"
    puts "params: #{params}"
    puts "********"
    puts submission_params[:submission]
    prompt = Prompt.for_today
    submission = CodeSubmission.new(
      content: submission_params[:submission],
      user: User.first, # TODO
      prompt: prompt
    )
    
    if submission.save
      # Run tests and create test results
      test_runner = CodeTestRunner.new(submission.content, submission.prompt_id)
      
      results = test_runner.generate_result_hash
      render json: { results: results }
    else
      render json: { errors: submission.errors.full_messages }, status: :unprocessable_entity
    end

  end

  def show
  end

  def submission_params
    params.require(:code_submission).permit(:submission)
  end
end
