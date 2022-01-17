class UsersController < ApplicationController
    before_action :set_user, only: %i[ show edit update destroy ]

    def new
        @user = User.new
    end

    # GET /user/1 or /user/1.json
    def show
    end

    def create
        @user = User.new(user_params)
        @user.branch = Current.branch
        if @user.save
            session[:user_id] = @user.id
            redirect_to root_path, notice: 'Thank you for signing up!'
        else
            render :new  
        end
    end

    def edit
    end

    def update
        respond_to do |format|
          if @user.update(user_params)
            format.html { redirect_to user_url(@user), notice: "Profile was successfully updated." }
            format.json { render :show, status: :ok, location: @user }
          else
            format.html { render :edit, status: :unprocessable_entity }
            format.json { render json: @@user.errors, status: :unprocessable_entity }
          end
        end
      end
    
      # DELETE /user/1 or /user/1.json
      def destroy
        @user.destroy
    
        respond_to do |format|
          format.html { redirect_to root_url, notice: "Profile was successfully destroyed." }
          format.json { head :no_content }
        end
      end

    private

    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation, :home_address, :phone_number, :passport_no)
    end

    def set_user
        @user = Current.user
    end
end
