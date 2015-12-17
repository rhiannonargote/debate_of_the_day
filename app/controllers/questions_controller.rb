class QuestionsController < ApplicationController
  before_action :logged_in_user, admin: true, only: [:new, :create, :destroy]

  def index
    @questions = Question.all
  end  

  def new 
    @question = Question.new
  end
  # A new action that can only be shown to admins (this will show the form)

  def create
    @question = Question.create(question_params)
    if @question.save
      flash[:success] = "Question created!"
      redirect_to root_url
    else
      render 'new'
    end
  end

  def show
    @question = Question.find params[:id]
  end  

  def destroy
    Question.find(params[:id]).destroy
    flash[:success] = "Question deleted"
    redirect_to questions_url
  end

  private

    def question_params
      params.require(:question).permit(:category, :for, :against)
    end
end
