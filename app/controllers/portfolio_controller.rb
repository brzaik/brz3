class PortfolioController < ApplicationController
  def index
    @highlighted_pages = Page.highlighted
    @other_pages = Page.non_highlighted.limit(4)
  end
end
