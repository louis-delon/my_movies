class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @avatar = current_user.avatar if user_signed_in?
  end
end
