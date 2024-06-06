module Searchable
  extend ActiveSupport::Concern

  included do
    include Elasticsearch::Model
    include Elasticsearch::Model::Callbacks

    mapping do
      # mapping definition goes here
      indexes :artist, type: :text
      indexes :title, type: :text
      indexes :lyrics, type: :text
      indexes :genre, type: :keyword
    end

    # Basic search
    # def self.search(query)
    #   params = {
    #     query: {
    #       multi_match: {
    #         query: query, 
    #         fields: [ :title, :artist, :lyrics ] 
    #       },
    #     },
    #   }
    
    #   self.__elasticsearch__.search(params)
    # end


    # Advanced search with filter same Model.where
    def self.search(query, genre = nil)
      params = {
        query: {
          bool: {
            must: [
              {
                multi_match: {
                  query: query, 
                  fields: [:title, :artist, :lyrics]
                }
              }
            ]
          }
        }
      }
      
      if genre
        params[:query][:bool][:filter] = [
          {
            term: { genre: genre }
          }
        ]
      end
      
      self.__elasticsearch__.search(params)
    end
    
    

    # def self.search(query)
    #   params = {
    #     query: {
    #       bool: {
    #         should: [
    #           { match: { title: query }},
    #           { match: { artist: { query: query, boost: 5 } }},
    #           { match: { lyrics: query }},
    #         ],
    #       }
    #     },
    #     highlight: { fields: { title: {}, artist: {}, lyrics: {} } }
    #   }
  
    #   self.__elasticsearch__.search(params)
    # end

  end
end