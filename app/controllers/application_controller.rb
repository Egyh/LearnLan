class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:top, :about]
  before_action :set_locale
  
     def set_locale
       I18n.locale = locale
     end
  
     def locale
       @locale ||= params[:locale] ||= I18n.default_locale
     end
  
     def default_url_options(options = {})
       options.merge(locale: locale)
     end
  
      def after_sign_in_path_for(resource)
        articles_path
      end
    
      def after_sign_out_path_for(resource)
        root_path
      end

  
end
