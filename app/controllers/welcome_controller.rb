class WelcomeController < ApplicationController
  def index
    @photos = Photo.last(5).reverse
  end
end
