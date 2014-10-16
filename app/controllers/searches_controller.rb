class SearchesController < ApplicationController
  def show
    @users = User.all
    @text_subjects = TextSubject.all
    @shouts = Shout.all
    
    search_term = params[:query]
    hashtag = params[:format]

    if search_term != nil
      user_results = @users.where("email ILIKE ?", "%#{search_term}%")   
      text_results = @text_subjects.where("body ILIKE ?", "%#{search_term}%")

      shout_results = text_results.map do |result|
        result.shout
      end

      @matches = user_results + shout_results
    else
      hash_results = @text_subjects.where("body ILIKE ?", "%#{hashtag}%")
      user_results = @users.where("email ILIKE ?", "%#{hashtag}%")   

      @matches = hash_results + user_results
    end

    @matches

  end
end
