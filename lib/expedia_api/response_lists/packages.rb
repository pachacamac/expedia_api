module ExpediaApi
  module ResponseLists
    class Packages < BaseResponseList

      def entries=(entries)
        @entries = entries.map {|e| ExpediaApi::Entities::PackageEntity.new(e.with_indifferent_access) }
      end

      def extract_entries_from_response(response)
        body = extract_data_from_response(response)
        return if body.length == 1
        hotel_count = body["HotelCount"].to_i
        if hotel_count == 1
          [body["HotelInfoList"]["HotelInfo"]]
        elsif hotel_count > 1
          body["HotelInfoList"]["HotelInfo"]
        else
          []
        end
      end
    end

  end
end
