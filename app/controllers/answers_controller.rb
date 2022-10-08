class AnswersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_question, only: %i[ new create ]
  before_action :set_answer, only: %i[ show edit update destroy ]

  
  # def index
  #   @answers = Answer.all
  # end
  
  # def show
  # end
  
  def new
    @answer = @question.answers.build
  end
  
  # def edit
  # end

  def create
    @answer = @question.answers.build(answer_params)
    @answer.user = current_user

    respond_to do |format|
      if @answer.save
        format.html { redirect_to questions_url, notice: "Answer was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  
  # def update
  #   respond_to do |format|
  #     if @answer.update(answer_params)
  #       format.html { redirect_to answer_url(@answer), notice: "Answer was successfully updated." }
  #     else
  #       format.html { render :edit, status: :unprocessable_entity }
  #     end
  #   end
  # end

  
  # def destroy
  #   @answer.destroy

  #   respond_to do |format|
  #     format.html { redirect_to answers_url, notice: "Answer was successfully destroyed." }
  #   end
  # end

  private
  
    def set_answer
      @answer = Answer.find(params[:id])
    end

    def set_question
      @question = Question.find(params[:question_id])
    end


    def answer_params
      params.require(:answer).permit(:title, :user_id, :question_id)
    end
end
