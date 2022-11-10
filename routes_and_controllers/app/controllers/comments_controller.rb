class CommentsController < ApplicationController

    def index
        if params.has_key?(:user_id)
            user = User.find_by(id: params[:user_id])
            if user
                render json: user.comments
            else
                render json: 'Artwork does not exist', status: 404
            end
        elsif params.has_key?(:artwork_id)
            artwork = Artwork.find_by(id: params[:artwork_id])
            if artwork
                render json: artwork.comments
            else
                render json: 'Artwork does not exist', status: 404
            end
        else
            comments = Comment.all
            render json: comments
        end
    end

    def create
    end

    def destroy
    end

    private
    def comment_params
        params.require(:comment).permit(:artwork_id, :author_id, :body)
    end
end

# /users/user_id/comments
# /artworks/artwork_id/comments