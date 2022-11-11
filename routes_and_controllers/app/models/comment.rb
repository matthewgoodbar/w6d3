# == Schema Information
#
# Table name: comments
#
#  id         :bigint           not null, primary key
#  body       :text             not null
#  author_id  :bigint           not null
#  artwork_id :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Comment < ApplicationRecord
    validates :author_id, presence: true
    validates :artwork_id, presence: true
    validates :body, presence: :true

    belongs_to :artwork,
    foreign_key: :artwork_id,
    class_name: :Artwork

    belongs_to :author,
    foreign_key: :author_id,
    class_name: :User

    has_many :likes,
    as: :likeable
end
