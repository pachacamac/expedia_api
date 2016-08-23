module ExpediaApi
  module Entities
    class PackageHotel
      attr_reader :raw_data

      def initialize(raw_data)
        @raw_data = raw_data || {}
      end

      def index
        raw_data[:HotelIndex].to_i
      end

      # returns the hotel id
      def id
        raw_data[:HotelID].to_i
      end

      # returns the name of the hotel
      def name
        raw_data[:Name]
      end

      def price
        if raw_data[:HotelPrice] && raw_data[:HotelPrice][:TotalRate]
          Money.new(raw_data[:HotelPrice][:TotalRate][:Value].to_f * 100, raw_data[:HotelPrice][:TotalRate][:Currency])
        else
          nil
        end
      end

      def promotion
        if raw_data[:Promotion] && raw_data[:Promotion][:Amount]
          Money.new(raw_data[:Promotion][:Amount][:Value].to_f * 100, raw_data[:Promotion][:Amount][:Currency])
        else
          nil
        end
      end

      # returns a string with a description of the given room in the hotel.
      def room_type_description
        @raw_data[:RoomRatePlanDescription]
      end

      # returns an array of amenities for the room in the offered package
      def room_amenity_list
        return [] if @raw_data[:RoomAmenityList].nil?
        if @raw_data[:RoomAmenityList].is_a?(Array)
          @raw_data[:RoomAmenityList]
        else
          [@raw_data[:RoomAmenityList]]
        end
      end

    end
  end
end
