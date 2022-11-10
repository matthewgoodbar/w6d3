class Artwork < ApplicationRecord
    validates :title, presence: true
    validates :image_url, presence: true, uniqueness: true
    validates :artist_id, uniqueness: {scope: :title}
end
