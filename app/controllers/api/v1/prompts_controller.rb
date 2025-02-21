module Api
  module V1
    class PromptsController < ApplicationController
      def today
        prompt = Prompt.for_today
        render json: prompt
      end
    end
  end
end
