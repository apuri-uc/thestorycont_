class ReflectionQuestionsController < ApplicationController
  def index
    matching_reflection_questions = ReflectionQuestion.all

    @list_of_reflection_questions = matching_reflection_questions.order({ :created_at => :desc })

    render({ :template => "reflection_questions/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_reflection_questions = ReflectionQuestion.where({ :id => the_id })

    @the_reflection_question = matching_reflection_questions.at(0)

    render({ :template => "reflection_questions/show" })
  end

  def create
    the_reflection_question = ReflectionQuestion.new
    the_reflection_question.question = params.fetch("query_question")
    the_reflection_question.day_id = params.fetch("query_day_id")

    if the_reflection_question.valid?
      the_reflection_question.save
      redirect_to("/reflection_questions", { :notice => "Reflection question created successfully." })
    else
      redirect_to("/reflection_questions", { :alert => the_reflection_question.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_reflection_question = ReflectionQuestion.where({ :id => the_id }).at(0)

    the_reflection_question.question = params.fetch("query_question")
    the_reflection_question.day_id = params.fetch("query_day_id")

    if the_reflection_question.valid?
      the_reflection_question.save
      redirect_to("/reflection_questions/#{the_reflection_question.id}", { :notice => "Reflection question updated successfully."} )
    else
      redirect_to("/reflection_questions/#{the_reflection_question.id}", { :alert => the_reflection_question.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_reflection_question = ReflectionQuestion.where({ :id => the_id }).at(0)

    the_reflection_question.destroy

    redirect_to("/reflection_questions", { :notice => "Reflection question deleted successfully."} )
  end
end
