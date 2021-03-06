class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @avatar = current_user.avatar if user_signed_in?
    @movies = Movie.most_recent.page(params[:page]).per(10)
  end

end
