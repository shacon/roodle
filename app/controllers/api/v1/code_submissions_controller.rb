class Api::V1::CodeSubmissionsController < ApplicationController
  def index
  end

  def create
    puts "this is getting hit"
    puts "params: #{params}"
    puts "********"
    puts submission_params[:submission]
    # SubmissionEvaluator(submission)
    # class SubmissionResults - has test1
    # Code
    # Next steps:
    # * grab today's prompt
    # * run the tests in that prompt against the submission - probably create a service for this
    # * will need to clean up submission to make it able to convert to code - use eval()?

  end

  def show
  end

  def submission_params
    params.require(:code_submission).permit(:submission)
  end
end
