class ItemsController < ApplicationController
    def index
        @users = User.includes(:user)
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        
    end

    def destroy

    end


    private
  def user_params
    params.require(:registration).permit(:nickname, :email, :encrypted_password, :family_name, :first_name, :family_name_kana, :first_name_kana, :birth_day).merge(user_id: current_user.id)
  end
end
