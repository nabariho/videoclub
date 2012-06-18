class HomeController < ApplicationController
  def index
	@films = Film.all
  end
end
