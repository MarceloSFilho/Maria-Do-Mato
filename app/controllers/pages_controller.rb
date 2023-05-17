class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :manufacturing]

  def home
    @products = policy_scope(Product).limit(4)
  end
end
