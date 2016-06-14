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
    end
  end
end
