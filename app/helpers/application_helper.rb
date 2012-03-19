module ApplicationHelper
  def submit(text=nil)
    raw tag "input", { :type => 'submit', :value => (text != nil ? text : t("helpers.form.submit")) }
  end
  
  def reset(text=nil)
    raw tag "input", { :type => 'reset', :value => (text != nil ? text : t("helpers.form.reset")) }
  end
  
  def new(text=nil)
    raw link_to (text != nil ? text : t("helpers.new")), {:action => "new"}, :class => "add"
  end
  
  def edit(data, text=nil)
    raw link_to (text != nil ? text : t("helpers.edit")), {:action => "edit", :id => data.id}, :class => "mod"
  end
  
  def delete(data, text=nil)
    #<td class=""><%= link_to t("helpers.delete"), user, confirm: t("helpers.confirm"), method: :delete %></td>
    raw link_to (text != nil ? text : t("helpers.delete")), { :action => "destroy", :id => data.id }, :class => "del", :confirm => "Are you sure you want to delete this article?", :method => :delete
  end
  
  def show(data, text=nil)
    raw link_to (text != nil ? text : t("helpers.show")), {:action => "show", :id => data.id}, :class => "view"
  end
  
  def back(text=nil)
    #<%= link_to t("helpers.form.back"), :action => "index" %>
    raw link_to (text != nil ? text : t("helpers.form.back")), {:action => "index"}, :class => "back"
  end
end
