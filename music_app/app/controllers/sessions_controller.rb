class SessionsController < ApplicationController
    def new
        render :new
    end

    def create
        @user = User.find_by_credentials(params[:user][:email], params[:user][:password])
        if @user 
            log_in_user!(@user) 
            redirect_to user_url(@user)
        else 
            # debugger
            render :new 
        end
    end

    def destroy 
        log_out
        render :new
    end

    private 

    # def user_params 
    #     params.require(:user).permit(:email, :password)
    # end
end