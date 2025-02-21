class Api::V1::CodeSubmissionsController < ApplicationController
  def index
  end

  def create
    prompt = Prompt.for_today
    submission = CodeSubmission.new(
      content: submission_params[:submission],
      user: User.first, # TODO
      prompt: prompt
    )

    if submission.save
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
