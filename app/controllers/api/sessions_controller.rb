class Api::SessionsController < ApplicationController
    before_action :require_login, only: [:destroy]
    
    def create
        @user = User.find_by_credentials(
            params[:user][:username],
            params[:user][:password]
        )

        if @user
            login!(@user)
            render "api/users/show"
        else
            render json: ["Please enter an E-mail and password"], status: 401
        end
    end
    
    def destroy
        @user = current_user
        if @user
            logout!
            render :destroy
        else
            render json: ["Nobody is signed in"], status: 404
        end
    end
end
