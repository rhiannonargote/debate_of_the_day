class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :load_latest_question

  include SessionsHelper

  private

    # Confirms a logged-in user.
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

    def load_latest_question
      @question = Question.last
    end
end