class Api::V1::UsersController < ApplicationController
    def index
      @all_users = User.all
  
      render :json => @all_users
    end

    def show
        @single_user = User.find(id: params[:user_id])
    
        render :json => @single_user
      end
    
  end
  