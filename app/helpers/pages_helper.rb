module PagesHelper
  def tag_includes_page?(tag)
    @page.tags.include?(tag)
  end
end
