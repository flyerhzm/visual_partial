require 'visual_partial'

module ActionView
  module RenderablePartial
    alias_method :origin_render_partial, :render_partial

    def render_partial(view, object = nil, local_assigns = {}, as = nil)
      template_content = origin_render_partial(view, object, local_assigns, as)
      if VisualPartial.display
        "<div style='position:absolute;background:red;z-index:99999;'>#{path_without_format_and_extension}</div>#{template_content}" 
      else
        template_content
      end
    end 
  end
end
