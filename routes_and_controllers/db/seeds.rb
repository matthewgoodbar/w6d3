# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


ApplicationRecord.transaction do

    puts 'Destroying tables...'
    Like.destroy_all
    Comment.destroy_all
    ArtworkShare.destroy_all
    Artwork.destroy_all
    User.destroy_all

    puts 'Resetting primary keys...'
    %w(likes comments artwork_shares artworks users).each do |table_name|
        ApplicationRecord.connection.reset_pk_sequence!(table_name)
    end

    puts 'Creating seed data...'
    u1 = User.create!(username: 'Picasso')
    u2 = User.create!(username: 'Frida Kahlo')
    u3 = User.create!(username: 'Jeff Koons')
    u4 = User.create!(username: 'Leonardo DaVinci')
    u5 = User.create!(username: 'Michaelangelo')
    u6 = User.create!(username: 'Andy Warhol')
    u7 = User.create!(username: 'Takashi Murakami')
    u8 = User.create!(username: 'Liu Xiaodong')
    u9 = User.create!(username: 'Luo Zhongli')

    a1 = Artwork.create!(title: 'Mona Lisa', image_url: 'asdkjhfg', artist_id: u4.id)
    a2 = Artwork.create!(title: 'Cistine Chapel', image_url: 'sakjdgi', artist_id: u5.id)
    a3 = Artwork.create!(title: 'Self Portrait', image_url: 'cabsdck', artist_id: u1.id)
    a4 = Artwork.create!(title: 'The Two Fridas', image_url: 'gsiuah', artist_id: u2.id)
    a5 = Artwork.create!(title: 'Untitled', image_url: 'cYQWEGD ', artist_id: u2.id)
    a6 = Artwork.create!(title: 'Untitled', image_url: 'cidsuagh', artist_id: u8.id)

    ArtworkShare.create!(viewer_id: u8.id, artwork_id: a3.id)
    ArtworkShare.create!(viewer_id: u1.id, artwork_id: a4.id)
    ArtworkShare.create!(viewer_id: u3.id, artwork_id: a2.id)
    ArtworkShare.create!(viewer_id: u2.id, artwork_id: a6.id)
    ArtworkShare.create!(viewer_id: u4.id, artwork_id: a5.id)
    ArtworkShare.create!(viewer_id: u5.id, artwork_id: a1.id)
    ArtworkShare.create!(viewer_id: u6.id, artwork_id: a3.id)

    c1 = Comment.create!(author_id: u1.id, artwork_id: a6.id, body: 'Great job!')
    c2 = Comment.create!(author_id: u2.id, artwork_id: a5.id, body: 'Could have done better...')
    c3 = Comment.create!(author_id: u3.id, artwork_id: a3.id, body: 'This one stinks!')
    c4 = Comment.create!(author_id: u4.id, artwork_id: a4.id, body: 'Amazing!')
    c5 = Comment.create!(author_id: u2.id, artwork_id: a2.id, body: 'Seen it before...')
    c6 = Comment.create!(author_id: u8.id, artwork_id: a2.id, body: 'Wonderful!!!')
    c7 = Comment.create!(author_id: u9.id, artwork_id: a2.id, body: 'Where can i buy the print??')
    c8 = Comment.create!(author_id: u9.id, artwork_id: a1.id, body: 'Cool i guess')

    Like.create!(liker_id: u2.id, likeable: c1)
    Like.create!(liker: u1, likeable: a1)
    Like.create!(liker_id: u5.id, likeable_id: c3.id, likeable_type: 'Comment')
    Like.create!(liker: u3, likeable: a6)
    Like.create!(liker: u6, likeable: c2)
    Like.create!(liker: u7, likeable: a6)
    Like.create!(liker: u8, likeable: c5)
    Like.create!(liker: u9, likeable: a4)
    Like.create!(liker: u4, likeable: a3)
    Like.create!(liker: u4, likeable: c1)


end