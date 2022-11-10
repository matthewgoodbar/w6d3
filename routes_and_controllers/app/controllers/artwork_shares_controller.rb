class ArtworkSharesController < ApplicationController
    def create
        a_share = ArtworkShare.new(artwork_share_params)
        if a_share.save
            render json: a_share
        else
            render json: a_share.errors.full_messages, status: :unprocessable_entity
        end
    end

    def destroy
        a_share = ArtworkShare.find_by(id: params[:id])
        if a_share
            a_share.destroy
            render json: a_share
        else
            render json: "Entity does not exist", status: 404
        end
    end

    private
    def artwork_share_params
        params.require(:artwork_share).permit(:artwork_id, :viewer_id)
    end
end