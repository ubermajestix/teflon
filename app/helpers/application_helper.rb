# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
 
  def nice_time(time)
    time.strftime("%I:%M %p %m/%d/%y")
  end
  
  def new_or_create?
    @controller.action_name == "new" || @controller.action_name == "create"
  end
  
  def dollar_format(float)
    sprintf("%.2f", float)
  end
end
