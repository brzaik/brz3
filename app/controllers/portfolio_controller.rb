class PortfolioController < ApplicationController
  def index
    @pages = Page.all
  end
end
