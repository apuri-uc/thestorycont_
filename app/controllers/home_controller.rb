class HomeController < ApplicationController
  def index
    render({ :template => "home/index" })
  end

  def home
    render({ :template => "home/show" })
  end
end
