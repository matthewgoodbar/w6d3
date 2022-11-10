# app/controllers/users_controller.rb

class UsersController < ApplicationController
    def index
        users = User.all #referring to the model, not database
        render json: users
    end

    def create
        user = User.new(params.require(:user).permit(:name, :email))
  # replace the `user_attributes_here` with the actual attribute keys
       if user.save
            render json: user
       else
        render json: user.errors.full_messages, status: :unprocessable_entity
       end
    end

    def show
        render json: params
    end
end