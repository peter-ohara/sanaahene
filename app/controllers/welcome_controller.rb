class WelcomeController < ApplicationController
  def index
    @tags = Tag.all
  end
end
