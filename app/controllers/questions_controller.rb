class QuestionsController < ApplicationController
  before_action :authenticate

  def index
    render json: filtered_questions.as_json(include: :answers)
  end

  private

  def filtered_questions
    scope = Question.includes(:answers).not_private
    if params[:title].present?
      scope = scope.where('lower(title) LIKE ?', "%#{params[:title].downcase}%")
    end
    scope
  end
end