module AdminHelper
  def menu(text, controller, action='index', pid=nil)
    if params[:controller].split('/').last == controller && params[:pid].to_s == pid.to_s
      return link_to text, {controller: controller, action: action, pid: pid}, :class=>'active'
    else
        return link_to text, {controller: controller, action: action, pid: pid}
    end
  end
end
