# app/controllers/users_controller.rb

class UsersController < ApplicationController
    def index
        users = User.all #referring to the model, not database
        render json: users
    end

    def create
        user = User.new(user_params)
        if user.save
            redirect_to user_url(user.id), status: :created
        else
            render json: user.errors.full_messages, status: :unprocessable_entity
        end
    end

    def show
        if user = User.find_by(id: params[:id])
            render json: user
        else
            render json: "Object was not created", status: 404
        end
    end

    def update
        user = User.find_by(id: params[:id])
        if user.update(user_params)
            redirect_to user_url(user.id)
        else
            render json: user.errors.full_messages, status: :unprocessable_entity
        end
    end

    def destroy
        user = User.find(params[:id])
        if user.destroy
            render json: user
        end
    end

    private
    def user_params
        params.require(:user).permit(:username)
    end
end