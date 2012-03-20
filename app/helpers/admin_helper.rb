module AdminHelper
  def menu(text, controller, action='index')
    if params[:controller].split('/').last == controller
      return link_to text, {controller: controller, action: action}, :class=>'active'
    else
        return link_to text, {controller: controller, action: action}
    end
  end
end
