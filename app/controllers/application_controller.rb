class ApplicationController < ActionController::Base
    before_action :set_current_user
    before_action :set_current_branch

    def set_current_user
      if session[:user_id]
       Current.user = User.find_by(id: session[:user_id])   
      end
    end

    def set_current_branch
      Current.branch = Branch.find_by(name: "Headquarters")   
    end
end
