class WelcomeController < ApplicationController
  def index
    @photos = Photo.where(visibility: :pub).last(15).reverse
  end
end
