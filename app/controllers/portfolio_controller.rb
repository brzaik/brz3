class PortfolioController < ApplicationController
  def index
    @highlighted_pages = Page.highlighted
    @other_pages = Page.non_highlighted.limit(4)
    @popular_tags = Tag.all
  end

  def all
    @pages = Page.all
    @tags = Tag.all
  end

  def show_tag
    @tag = Tag.find(params[:tag_id])
  end
end
