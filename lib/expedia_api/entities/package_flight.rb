module ExpediaApi
  module Entities
    class PackageFlight
      def initialize(raw_data)
        @raw_data = raw_data || {}
      end

      # returns the flight identifier for the given flight.
      def index
        @raw_data[:FlightIndex].to_i
      end

      # returns an array of flight legs for the given flight
      def flight_legs
        extract_flightlegs.map do |leg|
          PackageFlightLeg.new(leg)
        end
      end

      # extracts the json of the flight legs from the data.
      def extract_flightlegs
        data = @raw_data.fetch(:FlightItinerary, {}).fetch(:FlightLeg, [])
        if data.is_a?(Array)
          data
        else
          [data]
        end
      end

      def price
        if @raw_data[:FlightPrice] && @raw_data[:FlightPrice][:TotalRate]
          Money.new(@raw_data[:FlightPrice][:TotalRate][:Value].to_f * 100, @raw_data[:FlightPrice][:TotalRate][:Currency])
        else
          nil
        end
      end

    end
  end
end
