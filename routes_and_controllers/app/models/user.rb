# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  username   :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class User < ApplicationRecord
    validates :username, presence: true, uniqueness: true

    has_many :artworks,
    foreign_key: :artist_id,
    inverse_of: :artist,
    class_name: :Artwork,
    dependent: :destroy

    has_many :views,
    foreign_key: :viewer_id,
    class_name: :ArtworkShare,
    dependent: :destroy

    has_many :shared_artworks,
    through: :views,
    source: :artwork

    has_many :comments,
    foreign_key: :author_id,
    inverse_of: :author,
    class_name: :Comment,
    dependent: :destroy
end
