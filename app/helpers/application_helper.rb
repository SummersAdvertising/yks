module ApplicationHelper
  def submit(text=nil)
    raw tag "input", { :type => 'submit', :value => (text != nil ? text : t("helpers.form.submit")) }
  end
  
  def reset(text=nil)
    raw tag "input", { :type => 'reset', :value => (text != nil ? text : t("helpers.form.reset")) }
  end
  
  def new(text=nil)
    raw link_to (text != nil ? text : t("helpers.new")), :action => "new"
  end
  
  def edit(data, text=nil)
    raw link_to (text != nil ? text : t("helpers.edit")), :action => "edit", :id => data.id
  end
  
  def delete(data, text=nil)
    #<td><%= link_to t("helpers.delete"), user, confirm: t("helpers.confirm"), method: :delete %></td>
    raw link_to (text != nil ? text : t("helpers.delete")), data, confirm: t("helpers.confirm"), method: :delete
  end
  
  def show(data, text=nil)
    raw link_to (text != nil ? text : t("helpers.show")), :action => "show", :id => data.id
  end
  
  def back(text=nil)
    #<%= link_to t("helpers.form.back"), :action => "index" %>
    raw link_to (text != nil ? text : t("helpers.form.back")), :action => "index"
  end
end
