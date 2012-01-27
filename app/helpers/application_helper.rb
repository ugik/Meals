module ApplicationHelper
  
  # Return a title on a per-page basis.
  def title
    base_title = "Meals visual diary"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end
  
  def logo
    image_tag("meals_small.jpeg", :alt => "Meals", :class => "round")
  end
end
