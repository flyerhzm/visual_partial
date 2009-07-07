require 'visual_partial'

module ActionView
  module RenderablePartial
    alias_method :origin_render_partial, :render_partial

    def render_partial(view, object = nil, local_assigns = {}, as = nil)
      template_content = origin_render_partial(view, object, local_assigns, as)
      if VisualPartial.display
        if tr_partial?(template_content)
          "<tr><td>#{partial_display}</td></tr>#{template_content}"
        else
          partial_display + template_content 
        end
      else
        template_content
      end
    end 

    def tr_partial?(template_content)
      return template_content =~ /\s*<tr>/ || template_content =~ /\s*%tr/
    end

    def partial_display
      "<div style='position:absolute;background:red;z-index:99999;opacity:.7;'>#{path_without_format_and_extension}</div>"
    end
  end
end
