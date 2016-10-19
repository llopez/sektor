module Sektor
  class Query
    def initialize(collection)
      @collection = collection
      @filters = []
    end
  
    def add_filter(field, predicate, value)
      @filters.push Filter.new(field, predicate, value)
    end

    def result
      @collection.select do |track|
        @filters.all?{ |f| f.eval(track) }
      end
    end
  end
end

