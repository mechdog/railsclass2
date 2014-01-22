 module PetsHelper
 
  def color_to_class(color)
    "color-#{color}"
  end

  def pretty_text_field(f, field)
    %Q[
      <div>
        #{f.label field}
        #{f.text_field field}
      </div>
    ].html_safe    
  end

end
