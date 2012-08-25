module ApplicationHelper

  # Helper function for including CSS in the head
  def css_for_head filename, type=:page
    @head_css_cache = {} if @head_css_cache.nil?
    
    content_symbol = type == :page ? :page_assets : :layout_assets
    
    content_for content_symbol do
      stylesheet_link_tag("/css/" + filename)
    end if @head_css_cache[filename].nil?
    
    @head_css_cache[filename] = true
  end

  # Helper function for including JS in the head
  def js_for_head filename, type=:page
    @head_js_cache = {} if @head_js_cache.nil?
    
    content_symbol = type == :page ? :page_assets : :layout_assets
    
    content_for content_symbol do
      javascript_include_tag("/js/" + filename)
    end if @head_js_cache[filename].nil?
    
    @head_js_cache[filename] = true
  end

  # Helper function for including JS in the body  
  def js_for_body filename, type=:page
    @body_js_cache = {} if @body_js_cache.nil?
    
    javascript_include_tag("/js/" + filename) if @body_js_cache[filename].nil?
    
    @body_js_cache[filename] = true
  end

end
