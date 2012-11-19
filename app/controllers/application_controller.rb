class ApplicationController < ActionController::Base
  before_filter :set_locale, :clear_setting
  before_filter :list_banners

  def permission
	  respond_to do |format|
			format.html { redirect_to :controller => :login, :action => :login }
	  end
  end
  
  def clear_setting  	
	  $meta_title = nil
	  $meta_description = nil
  end
  
  protect_from_forgery

 def list_banners
 	@partial_banners = Banner.all
 	 
 end

  def set_locale
    # 可以將 ["en", "zh-TW"] 設定為 VALID_LANG 放到 /config/environment.rb 中
    if params[:locale] && ["en", "zh-TW"].include?( params[:locale] )
      session[:locale] = params[:locale]
    end

    I18n.locale = session[:locale] || I18n.default_locale
  end
end
