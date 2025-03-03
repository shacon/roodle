class Api::V1::CodeSubmissionsController < ApplicationController
  def index
  end

  def create
    begin
      prompt = Prompt.for_today
      submission_content = submission_params[:submission]
      test_runner = CodeTestRunner.new(submission_content, prompt.id)
      results = test_runner.generate_result_hash
      render json: { results: results }
    rescue => e
      render json: { errors:e.message }, status: :unprocessable_entity
    end
  end

  def show
  end

  def submission_params
    params.require(:code_submission).permit(:submission)
  end
end
