class ArtworksController < ApplicationController
    def show
        if artwork = Artwork.find_by(id: params[:id])
            render json: artwork
        else
            render json: "Object was not created", status: 404
        end
        
    end

    def index
        artworks = artworks_for_user_id(params[:user_id])
        if artworks
            render json: artworks
        else
            render json: 'No artworks exist', status: 404
        end
    end

    def create
        artwork = Artwork.new(artwork_params)
        if artwork.save
            redirect_to artwork_url(artwork.id)
        else
            render json: artwork.errors.full_messages, status: :unprocessable_entity
        end
    end

    def update
        artwork = Artwork.find_by(id: params[:id])
        if artwork.update(artwork_params)
            redirect_to artwork_url(artwork.id)
        else
            render json: artwork.errors.full_messages, status: :unprocessable_entity
        end
    end

    def destroy
        artwork = Artwork.find(params[:id])
        if artwork.destroy
            render json: artwork
        end
    end

    private
    def artwork_params
        params.require(:artwork).permit(:artist_id, :title, :image_url)
    end

    def artworks_for_user_id(user_id)
        user = User.find_by(id: user_id)
        if user
            return Artwork
                .left_outer_joins(:shares)
                .where("(artworks.artist_id = #{user_id}) OR (artwork_shares.viewer_id = #{user_id})")
                .distinct
        else
            return nil
        end
    end
end