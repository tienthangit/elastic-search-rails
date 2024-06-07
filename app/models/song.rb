require 'csv'

class Song < ApplicationRecord
  include Searchable

  def self.import_csv!
    filepath = "tcc_ceds_music.csv"
    res = CSV.parse(File.read(filepath), headers: true)
    res.each_with_index do |s, ind|
      Song.create!(
        artist: s["artist_name"],
        title: s["track_name"],
        genre: s["genre"],
        lyrics: s["lyrics"]
      )
    end
  end
end

Song.__elasticsearch__.client.indices.delete index: Song.index_name rescue nil

# Create the new index with the new mapping
Song.__elasticsearch__.client.indices.create \
  index: Song.index_name,
  body: { settings: Song.settings.to_hash, mappings: Song.mappings.to_hash }

Song.import