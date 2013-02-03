class PortfolioController < ApplicationController
  def index
    @highlighted_pages = Page.highlighted
    @other_pages = Page.non_highlighted.limit(4)
    @popular_tags = Tag.all
  end

  def all
    if user_signed_in?
      @pages = Page.all
      @tags = Tag.all
    else
      @pages = Page.public.all
      @tags = Tag.public.all
    end
    
  end

  def show_tag
    if user_signed_in?
      @tag = Tag.find(params[:tag_id])
      @tags = Tag.all
    else
      @tag = Tag.public.find(params[:tag_id])
      @tags = Tag.public.all
    end
  end
end
