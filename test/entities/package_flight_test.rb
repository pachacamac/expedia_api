require 'response_mocks'
require 'test_helper'

describe ExpediaApi::Entities::PackageFlight do
  let(:client) { ExpediaApi::Client.new }
  let(:api_json) do
    {"FlightIndex"=>"1",
 "FlightItinerary"=>
  {"FlightLeg"=>
    [{"FlightLegIndex"=>"1",
      "FlightDuration"=>"PT12H2M",
      "FlightSegment"=>
       [{"FlightSegmentIndex"=>"1",
         "DepartureAirportCode"=>"HAM",
         "ArrivalAirportCode"=>"AMS",
         "DepartureDateTime"=>"2016-11-10T10:20:00",
         "ArrivalDateTime"=>"2016-11-10T11:30:00",
         "CarrierCode"=>"DL",
         "FlightNumber"=>"9283",
         "FlightDuration"=>"PT1H10M",
         "OperatingCarrierCode"=>"KL"},
        {"FlightSegmentIndex"=>"2",
         "DepartureAirportCode"=>"AMS",
         "ArrivalAirportCode"=>"DTW",
         "DepartureDateTime"=>"2016-11-10T13:00:00",
         "ArrivalDateTime"=>"2016-11-10T15:56:00",
         "CarrierCode"=>"DL",
         "FlightNumber"=>"137",
         "FlightDuration"=>"PT8H56M"},
        {"FlightSegmentIndex"=>"3",
         "DepartureAirportCode"=>"DTW",
         "ArrivalAirportCode"=>"LGA",
         "DepartureDateTime"=>"2016-11-10T17:30:00",
         "ArrivalDateTime"=>"2016-11-10T19:26:00",
         "CarrierCode"=>"DL",
         "FlightNumber"=>"582",
         "FlightDuration"=>"PT1H56M"}]},
     {"FlightLegIndex"=>"2",
      "FlightDuration"=>"PT9H31M",
      "FlightSegment"=>
       [{"FlightSegmentIndex"=>"1",
         "DepartureAirportCode"=>"LGA",
         "ArrivalAirportCode"=>"BOS",
         "DepartureDateTime"=>"2016-11-15T17:00:00",
         "ArrivalDateTime"=>"2016-11-15T18:29:00",
         "CarrierCode"=>"DL",
         "FlightNumber"=>"2688",
         "FlightDuration"=>"PT1H29M"},
        {"FlightSegmentIndex"=>"2",
         "DepartureAirportCode"=>"BOS",
         "ArrivalAirportCode"=>"AMS",
         "DepartureDateTime"=>"2016-11-15T19:33:00",
         "ArrivalDateTime"=>"2016-11-16T08:30:00",
         "CarrierCode"=>"DL",
         "FlightNumber"=>"126",
         "FlightDuration"=>"PT6H57M"},
        {"FlightSegmentIndex"=>"3",
         "DepartureAirportCode"=>"AMS",
         "ArrivalAirportCode"=>"HAM",
         "DepartureDateTime"=>"2016-11-16T12:30:00",
         "ArrivalDateTime"=>"2016-11-16T13:35:00",
         "CarrierCode"=>"DL",
         "FlightNumber"=>"9284",
         "FlightDuration"=>"PT1H5M",
         "OperatingCarrierCode"=>"KL"}]}]},
 "FlightPrice"=>{"BaseRate"=>{"Value"=>"138.00", "Currency"=>"EUR"}, "TaxesAndFees"=>{"Value"=>"410.53", "Currency"=>"EUR"}, "TotalRate"=>{"Value"=>"548.53", "Currency"=>"EUR"}},
 "TicketsRemaining"=>"9"}.with_indifferent_access
  end

  let(:entity) { ExpediaApi::Entities::PackageFlight.new(api_json) }

  describe "#initialize" do
    it "creates a new package flight object" do
      assert_equal ExpediaApi::Entities::PackageFlight, ExpediaApi::Entities::PackageFlight.new({}).class
    end
  end

  describe "#price" do
    it "returns the total flight price" do
      price = 548.53
      assert_equal price, entity.price.to_f
    end
  end


end
