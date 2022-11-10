class RenameArtistIdInArtworks < ActiveRecord::Migration[7.0]
  def change
    rename_column :artworks, :artist_id_id, :artist_id
  end
end
