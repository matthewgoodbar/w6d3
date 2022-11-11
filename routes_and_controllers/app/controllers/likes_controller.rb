class LikesController < ApplicationController
    def index
        if params.has_key?(:user_id)
            #need improvement
        elsif params.has_key?(:artwork_id)
            artwork_like = Artwork.find_by(id: params[:artwork_id]).likes.likers
            render json: artwork_like
        elsif params.has_key?(:comment_id)
            comment_like = Comment.find_by(id: params[:comment_id]).likes.likers
            render json: comment_like
        end
    end
end