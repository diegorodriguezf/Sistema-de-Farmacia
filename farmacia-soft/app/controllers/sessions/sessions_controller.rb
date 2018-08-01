# frozen_string_literal: true

class Sessions::SessionsController < ApplicationController
  # before_action :configure_sign_in_params, only: [:create]
  # GET /resource/sign_in
    def new
      super
    end
    def create
       user = login(params[:username], params[:password], params[:remember_me])
       respond_to do |format|
        if user
          format.js { render 'go_to_dashboard'}
        else
          format.js { render 'error_authentication', content_type: 'text/javascript'  }
        end
      end
    end

  def destroy
     logout
     redirect_back_or_to(root_path,message:"Logout");
  end

end