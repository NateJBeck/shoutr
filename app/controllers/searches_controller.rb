class SearchesController < ApplicationController
  def show
    @users = User.all
    @text_subjects = TextSubject.all
    @shouts = Shout.all
    
    search_term = params[:query]

    user_results = @users.where("email ILIKE ?", "%#{search_term}%")   
    text_results = @text_subjects.where("body ILIKE ?", "%#{search_term}%")
    shout_results = text_results.map do |result|
      result.shout
    end
    @matches = user_results + shout_results

  end
end
