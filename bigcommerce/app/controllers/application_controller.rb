class ApplicationController < ActionController::Base

    private

    def confirm_logged_in
      unless session[:user_id]
        flash[:notice] = "Please Log In"
        redirect_to controller: 'access', action: 'login'
        return false
      else
        return true
      end
    end


end
