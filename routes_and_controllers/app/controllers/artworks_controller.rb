class ArtworksController < ApplicationController
    def show
        if artwork = Artwork.find_by(id: params[:id])
            render json: artwork
        else
            render json: "Object was not created", status: 404
        end
        
    end

    def index
        artworks = Artwork.all
        render json: artworks
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
end