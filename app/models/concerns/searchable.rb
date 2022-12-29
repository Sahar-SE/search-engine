module Searchable
    extend ActiveSupport::Concern
  
    included do
      include Elasticsearch::Model
      include Elasticsearch::Model::Callbacks

      mapping do
        indexes :actors, type: :text
        indexes :title, type: :text
        indexes :description, type: :text
        indexes :genre, type: :keyword
        indexes :country, type: :keyword
      end
  
      def self.search(query)
        params = {
      query: {
        bool: {
          should: [
            { match: { title: { query: query, fuzziness: "AUTO"  }}},
            { match: { description: { query: query, fuzziness: "AUTO"  } }},
            { match: {country: query }},
          ],
        }
      },
    }
        self.__elasticsearch__.search(params)
      end
    end
  end