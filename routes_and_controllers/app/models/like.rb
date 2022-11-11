class Like < ApplicationRecord
    validates :likeable, presence: true
    validates :liker, presence: true

    belongs_to :liker,
    foreign_key: :liker_id,
    class_name: :User

    belongs_to :likeable, polymorphic: true
end
