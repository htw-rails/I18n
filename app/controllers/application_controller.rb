class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :set_i18n_locale_from_params
  before_filter :set_i18n_from_form
  protected
  def set_i18n_locale_from_params 
    if params[:locale]
      if I18n.available_locales.include?(params[:locale].to_sym)
        I18n.locale = params[:locale]
      else
        flash.now[:notice] = "#{params[:locale]} translation not available"
        logger.error flash.now[:notice]
      end
    end
  end
  def set_i18n_from_form
      if params[:set_locale]
        p = params[:locale_path]
        np = p.gsub(Regexp.new('^\/'+I18n.locale.to_s),"/"+params[:set_locale])
        redirect_to np
      end
  end
  def default_url_options
     { locale: I18n.locale }
   end
end
