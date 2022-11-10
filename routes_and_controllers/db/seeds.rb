# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


ApplicationRecord.transaction do

    puts 'Destroying tables...'
    Artwork.destroy_all
    User.destroy_all

    puts 'Resetting primary keys...'
    %w(artworks users).each do |table_name|
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

    Artwork.create!(title: 'Mona Lisa', image_url: 'asdkjhfg', artist_id: u4.id)
    Artwork.create!(title: 'Cistine Chapel', image_url: 'sakjdgi', artist_id: u5.id)
    Artwork.create!(title: 'Self Portrait', image_url: 'cabsdck', artist_id: u1.id)
    Artwork.create!(title: 'The Two Fridas', image_url: 'gsiuah', artist_id: u2.id)
    Artwork.create!(title: 'Untitled', image_url: 'cYQWEGD ', artist_id: u2.id)
    Artwork.create!(title: 'Untitled', image_url: 'cidsuagh', artist_id: u8.id)

end