module ApplicationHelper
  def submit(text=nil)
    raw tag "input", { :type => 'submit', :value => (text != nil ? text : t("helpers.form.submit")) }
  end
  
  def cancel(text=nil)
    raw tag "input", { :type => 'button', :value => (text != nil ? text : t("helpers.form.cancel")), :onclick => "location.href='"+ url_for(:action=>"index", :pid => params[:pid])+"';" }
  end
  
  def new(text=nil)
    raw link_to (text != nil ? text : t("helpers.new")), {:action => "new", :pid => params[:pid]}, :class => "add"
  end
  
  def edit(data, text=nil)
    raw link_to (text != nil ? text : t("helpers.edit")), {:action => "edit", :pid => params[:pid], :id => data.id}, :class => "mod"
  end
  
  def delete(data, text=nil)
    raw link_to (text != nil ? text : t("helpers.delete")), { :action => "destroy", :pid => params[:pid], :id => data.id }, :class => "del", :confirm => "Are you sure you want to delete this article?", :method => :delete
  end
  
  def show(data, text=nil)
    raw link_to (text != nil ? text : t("helpers.show")), {:action => "show", :pid => params[:pid], :id => data.id}, :class => "view"
  end
  
  def back(text=nil)
    raw link_to (text != nil ? text : t("helpers.form.back")), {:action => "index", :pid => params[:pid]}, :class => "back"
  end
  
  def nl2br(html)
    raw(html.gsub(/[(\n)(\r)]/, "\n" => "<br/>", "\r" => "" ))
  end
end
