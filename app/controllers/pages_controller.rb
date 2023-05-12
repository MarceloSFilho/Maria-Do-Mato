class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :manufacturing]

  def home
  end
end
